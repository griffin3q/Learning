use rand::distributions::Alphanumeric;
use rand::{thread_rng, Rng};
use std::io;

fn generate(x: u32) {
    for i in 0..x {
        let pass: String = thread_rng()
            .sample_iter(&Alphanumeric)
            .take(30)
            .map(char::from)
            .collect();

        println!("Pass #{}: {}", i + 1, pass);
    }
}

fn main() {
    let mut y = String::new();

    println!("Enter number of passwords to generate: ");
    io::stdin().read_line(&mut y).expect("Value Error!");

    let x: u32 = match y.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Value Error!");
            return;
        }
    };

    generate(x);
}
