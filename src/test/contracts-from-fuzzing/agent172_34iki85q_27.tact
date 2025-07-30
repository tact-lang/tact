struct Sub {
    x: Int = 5;
    y: Bool = true;
}

struct Wrap {
    a: Int = 1;
    b: Sub = Sub{};
}

contract NestedStructDefaults {
    w: Wrap;

    init() {
        self.w = Wrap{};
    }
}