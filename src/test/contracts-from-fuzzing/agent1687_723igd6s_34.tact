struct NestedDefault {
    a: Int;
    b: Int = 5;
}

struct Wrapper {
    nd: NestedDefault = NestedDefault{ a: 1 };
}

contract WrapperTest {
    w: Wrapper;

    init() {
        self.w = Wrapper{};
    }
}