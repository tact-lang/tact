struct Complex {
    x: Int;
    y: Bool;
    z: Cell;
    addr: Address;
    flag: Bool?;
    data: Cell?;
}

contract ManyTypesFields {
    config: Complex;

    init() {
        self.config = Complex{
            x: 5,
            y: true,
            z: emptyCell(),
            addr: myAddress(),
            flag: null,
            data: null
        };
    }
}