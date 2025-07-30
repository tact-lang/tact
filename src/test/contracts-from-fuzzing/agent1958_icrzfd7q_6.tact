struct S {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
}

contract Multitype {
    complex: S;

    init() {
        self.complex = S{
            f1: 10,
            f2: true,
            f3: "abc",
            f4: emptyCell(),
            f5: myAddress()
        };
    }
}
