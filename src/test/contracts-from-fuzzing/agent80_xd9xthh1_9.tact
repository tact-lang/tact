struct Composite {
    a: Int;
    b: Int?;
}

contract Test {
    composite: Composite;

    init() {
        self.composite = Composite{ a: 10, b: null };
    }

    get fun getComposite(): Composite {
        return self.composite;
    }

    receive() {}
}
