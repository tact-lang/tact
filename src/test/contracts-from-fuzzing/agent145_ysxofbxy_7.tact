struct NestedDefault {
    x: Int = 5;
    y: Bool = true;
}

struct OuterDefault {
    s: NestedDefault = NestedDefault{};
    flag: Bool = false;
}

contract DefaultStructFieldsTest {
    data: OuterDefault;
    num: Int;

    init() {
        self.data = OuterDefault{};
        self.num = 17;
    }
}