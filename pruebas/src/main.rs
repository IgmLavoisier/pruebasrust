// funcion y enum.

fn main() {
    enum Miembro {
        Mano,
        Pie,
    }

    fn otromiembro(entrada: Miembro) {
        match entrada {
            Miembro::Pie => print!(" esto es un pie "),
            _ => print!(" esto es otro pene "),
        }
    }

    otromiembro(Miembro::Mano);
}
