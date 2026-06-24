struct S {
    label: String = "default";
    amount: Int = 123;
    flag: Bool = true;
}

contract DefaultsTest {
    a: S;
    b: S;

    init() {
        self.a = S{};
        self.b = S{label:"non-default", amount:456, flag:false};
    }

    receive() {}
}