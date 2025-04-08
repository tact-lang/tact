struct EvenDeeper {
    deepVal: Int?;
}

struct Nested {
    nestedDeeper: EvenDeeper?;
    innerInt: Int;
}

struct Wrapper {
    nest: Nested?;
    b: Bool;
}

contract Test {
    store: Wrapper?;

    init() {
        self.store = null;
    }
}