struct SimpleStruct {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    s: SimpleStruct;

    init() {
        self.s = SimpleStruct{
            a: 1,
            b: true,
            c: myAddress(),
        };
    }
}