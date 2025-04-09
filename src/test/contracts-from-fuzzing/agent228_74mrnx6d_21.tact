struct S {
    foo: Int = 1;
    bar: Bool = true;
}

contract ReassignInit {
    val: S;

    init() {
        self.val = S{ foo: 42, bar: false };
        self.val = S{ foo: 100, bar: true };
    }
}