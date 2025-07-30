struct Complex {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
    d: Cell;
    e: Address;
}

contract MixedTypes {
    x: Complex;

    init() {
        self.x = Complex{
            b: null,
            d: emptyCell(),
            e: myAddress()
        };
    }

    receive() {}
}