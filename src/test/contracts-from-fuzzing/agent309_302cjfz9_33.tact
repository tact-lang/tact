struct MultipleDefaults {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "x";
    addr: Address;
}

contract StructWithPartialDefaults {
    val: MultipleDefaults;

    init() {
        self.val = MultipleDefaults{ addr: myAddress() };
    }
}