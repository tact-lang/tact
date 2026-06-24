struct BoolAndIntDefaults {
    b: Bool = false;
    i: Int = 0;
}

contract BoolIntDefaultsTest {
    d: BoolAndIntDefaults;

    init() {
        self.d = BoolAndIntDefaults{};
    }

    receive() {
        self.d = BoolAndIntDefaults{b:true,i:42};
    }
}