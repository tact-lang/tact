struct StructWithEmbeddedOptionals {
    a: Int?;
    b: Embedded?;
}

struct Embedded {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: StructWithEmbeddedOptionals;

    init() {
        self.data = StructWithEmbeddedOptionals {
            a: null,
            b: Embedded {
                x: 99,
                y: true
            }
        };
    }
}