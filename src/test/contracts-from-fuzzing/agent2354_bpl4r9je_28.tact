struct Sub {
    y: Int = 7;
}

contract NestedDefaultsField {
    sub: Sub = Sub{};

    init() {}
}