INVENTORY
=========

Simple stackholding utility.

Overview
--------

The purpose of *INVENTORY* is to keep track of assets (tangible assets,
materials, etc.), owners, purchases, related documents, formal procedures
and other aspects of stocktaking. The whole project consists of three
components

- `MySQL`_ database to keep basic information and relations between objects,
- an on-disk repository where attachments and other files are stored. The
  `MySQL`_ database only keeps track on file locations and physically files are
  stored in this repository,
- `LibreOffice Base`_ project named **inventory.odb** -- its purpose is to
  provide user interface to the MySQL.


Installation
------------

Checking out repository.

.. code::

   git clone https://github.com:ptomulik/inventory
   cd inventory
   util/checkout-odb         # inventory.d -> inventory.odb

Preparing database

1. Create empty MySQL database (call it ``inventory``) and grant a DB user (call it
   ``inventory`` too) rights to the database.
3. Create tables in ``inventory`` databases

   .. code::

      cat inventory.sql | mysql -u inventory -p inventory

Notes
-----

1. You must have macros enabled in your `LibreOffice Base`_ to use
   **inventory.odb**. My macros are not signed by trusted party so you probably
   have to change your macro safety settings to lower:
   **Tools | Options | Security | Macro Protection | Medium**
2. You must define you'r repository path in **config** table. Set the
   **repository_path** record in **config** table.
3. You probably also have to install **libreoffice-mysql-connector** package::

   apt-get install libreoffice-mysql-connector

Developer Notes
---------------

Cloning fresh repository:

.. code::

   git clone git@github.com:ptomulik/inventory
   cd inventory
   util/checkout-odb         # inventory.d -> inventory.odb

Commiting changes made to ``inventory.odb``

.. code::

   util/commit-odb       # inventory.odb -> inventory.d
   git add -A
   git commit -m 'commit message'


Updating database structure from running database:

.. code::

   mysqldump -u inventory -p inventory -d --single-transaction | sed 's/ AUTO_INCREMENT=[0-9]*//g' > inventory.sql

.. _LibreOffice Base: https://www.libreoffice.org/discover/base/
.. _MySQL: http://www.mysql.com/
