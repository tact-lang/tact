struct Wrap { a: Int; }

contract InitDefaultsNested {
    a: Int = 1;
    b: Wrap = Wrap{ a: 2 };
    init() {}
}