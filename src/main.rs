#![deny(clippy::all)]
#![allow(clippy::derive_partial_eq_without_eq)]

use diesel::Connection;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let database_url = "mysql://test:test@db:3306/test".to_owned();
    println!("{database_url}");
    diesel::MysqlConnection::establish(&database_url).unwrap();

    Ok(())
}
