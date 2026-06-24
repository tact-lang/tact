struct Nested {
    foo: Bool;
    bar: Int?;
}

struct Mid {
    nest: Nested;
    val: Int;
}

contract DeepNested {
    fieldA: Int;
    midLevel: Mid;
    boolVal: Bool;

    init() {
        self.fieldA = 5;
        self.midLevel = Mid{nest: Nested{foo: true, bar: null}, val: 7};
        self.boolVal = false;
    }
}