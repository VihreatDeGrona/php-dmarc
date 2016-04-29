USE dmarc

CREATE TABLE report (
  "serial" serial NOT NULL,
  date_begin timestamp NOT NULL DEFAULT '2001-01-01 00:00:00',
  date_end timestamp NOT NULL DEFAULT '2001-01-01 00:00:00',
  domain varchar(255) NOT NULL,
  org varchar(255) NOT NULL,
  report_id varchar(255) NOT NULL,
  PRIMARY KEY ("serial"),
  UNIQUE (domain,report_id)
);

CREATE TYPE policytype AS ENUM('none','quarantine','reject');
CREATE TYPE dkimtype AS ENUM('none','pass','fail','neutral','policy','temperror','permerror');
CREATE TYPE spftype AS ENUM('none','neutral','pass','fail','softfail','temperror','permerror');

CREATE TABLE rptrecord (
  "serial" integer NOT NULL,
  ip varchar(39) NOT NULL,
  count integer NOT NULL,
  disposition policytype,
  reason varchar(255),
  dkim_domain varchar(255),
  dkim_result dkimtype,
  spf_domain varchar(255),
  spf_result spftype,
  PRIMARY KEY ("serial", ip)
);
