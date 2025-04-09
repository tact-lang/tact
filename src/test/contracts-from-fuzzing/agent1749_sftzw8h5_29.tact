struct InnerInit {
    foo: Int;
    bar: Bool;
}

contract StructOverwrite {
    s: InnerInit;

    init() {
        self.s = InnerInit{ foo: 1, bar: false };
        self.s = InnerInit{ foo: 999, bar: true };
    }
}