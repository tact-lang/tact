struct A {
    x: Int;
    y: Int?;
    z: String;
    flag: Bool;
    data: Cell;
    addr: Address;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{
            x: 10,
            y: null,
            z: "hi",
            flag: false,
            data: emptyCell(),
            addr: myAddress(),
        };
    }
}