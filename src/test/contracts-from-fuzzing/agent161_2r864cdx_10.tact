struct EmbeddedA {
    f1: Bool;
    f2: String;
}

struct EmbeddedB {
    i1: Int;
    i2: EmbeddedA;
}

contract ComplexEmbed {
    val: EmbeddedB;

    init() {
        self.val = EmbeddedB{ i1: 123, i2: EmbeddedA{ f1: true, f2: "abc" } };
    }

    receive() {
        self.val = EmbeddedB{ i1: 456, i2: EmbeddedA{ f1: false, f2: "def" } };
    }
}