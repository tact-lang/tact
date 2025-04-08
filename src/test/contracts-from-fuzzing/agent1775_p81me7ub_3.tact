struct Complex {
    a: Int = 1;
    b: String = "b";
    c: Bool?; 
    d: Cell?;
    e: Int? = null;
}

contract TestOptionals {
    complex: Complex;

    init() {
        self.complex = Complex{
            a: 5,
            b: "test",
            c: true,
            d: emptyCell(),
            e: 10,
        };
    }
}