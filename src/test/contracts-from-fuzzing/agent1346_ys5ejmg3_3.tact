struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptNested {
    x: NestedOpt = NestedOpt { a: null, b: true };
    y: Int? = null;

    init() {
        if (self.x.a != null) {
            self.y = self.x.a;
        } else {
            self.y = 0;
        }
    }
}
