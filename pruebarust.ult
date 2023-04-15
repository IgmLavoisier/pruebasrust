// struct array

fn main() {
    struct Ar {
        nombre: String,
        anonacimiento: i32,
    }

    let hola = Ar {
        anonacimiento: 1971,
        nombre: String::from("holacio"),
    };

    println!("{} {}", hola.nombre, hola.anonacimiento);

    impl Ar {
        fn flu(&self) {
            println!("que flu! {}", self.anonacimiento);
        }
    }

    hola.flu();

    let mut gente: Vec<Ar> = vec![];
    for i in 0..100 {
        let ho = Ar {
            anonacimiento: 1871 + i,
            nombre: String::from("holacio"),
        };
        gente.push(ho);
    }

    gente[90].flu();
    gente[90].anonacimiento = 333;
    gente[90].flu();
}
