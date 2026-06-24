struct Bools {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

struct NestBools {
    f1: Bools;
    f2: Bools?;
}

contract OptionalInsideOptional {
    nested: NestBools?;

    init() {
        self.nested = null;
    }
}