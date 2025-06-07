struct Multi {
    x: Int;
    y: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract MixedFields {
    m: Multi;

    init() {
        self.m = Multi{
            x: 7,
            y: false,
            s: "hello",
            c: emptyCell(),
            addr: myAddress()
        };
    }
}