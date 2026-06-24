struct StructWithDefault {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "abc";
}

contract StructDefaultTest {
    ss: StructWithDefault;

    init() {
        self.ss = StructWithDefault{};
    }
}
