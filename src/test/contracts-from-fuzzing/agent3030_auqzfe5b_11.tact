struct TwoDefaultsOpt {
    foo: Int = 42;
    bar: Bool?;
    baz: String = "hi";
}

contract DefaultTest {
    val: TwoDefaultsOpt;

    init() {
        self.val = TwoDefaultsOpt{ bar: null };
    }
}