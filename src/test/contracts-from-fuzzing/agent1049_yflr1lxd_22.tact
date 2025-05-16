struct Inner {
    data: Int as uint32;
    flag: Bool;
}

contract SerializeNestedTypes {
    nested: Inner;

    init() {
        self.nested = Inner { data: 55, flag: true };
    }
}