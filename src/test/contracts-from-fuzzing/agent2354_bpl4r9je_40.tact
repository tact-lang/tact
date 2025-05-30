struct Sub {
    x: Int = 0;
}

contract InitOverridesNested {
    nested: Sub = Sub{};

    init() {
        self.nested = Sub{ x: 42 };
    }
}