struct S {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
}

contract LargeStructAssignInit {
    comp: S;
    init() {
        self.comp = S{ i: 42, b: true, s: "txt", a: myAddress() };
    }
}