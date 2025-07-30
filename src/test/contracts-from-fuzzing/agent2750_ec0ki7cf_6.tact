struct NestedWithDefault {
    num: Int = 5;
    flag: Bool;
}

contract DefaultsTest {
    data: NestedWithDefault;
    init() {
        self.data = NestedWithDefault {
            flag: true
        };
    }
}
