struct InnerS {
    b: Bool;
}

struct OuterS {
    i: InnerS?;
}

contract OptNestedField {
    x: OuterS;

    init() {
        self.x = OuterS{ i: null };
    }
}