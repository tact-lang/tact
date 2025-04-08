struct Mixed {
    n: Int;
    flag: Bool;
    addr: Address;
    c: Cell;
    s: String;
}

contract MixedTypes {
    data: Mixed;

    init() {
        self.data = Mixed{
            n: 42,
            flag: true,
            addr: myAddress(),
            c: emptyCell(),
            s: "Hello"
        };
    }
}