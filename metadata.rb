name             "swftools"
maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs SWFTools: utilities for working with Adobe Flash files (SWF files)."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.6"

recipe "default",         "Installs SWFTools."
recipe "apt_repository",  "Adds an apt repository (in Ubuntu) containing the swftools pacakge."

supports "ubuntu"

depends "apt"
