struct Base {
    a: Int?;
    b: Int;
}

contract BaseOption {
    x: Base;

    init() {
        self.x = Base{ a: null, b: 123 };
    }
}