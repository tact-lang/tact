struct StructOne {
    val: Int;
}

struct StructTwo {
    one: StructOne;
    sval: String = "hi";
}

struct StructThree {
    two: StructTwo;
    optionalInt: Int?;
}

contract ComplexDefaults {
    data: StructThree;

    init() {
        self.data = StructThree{
            two: StructTwo{ one: StructOne{ val: 1 } },
            optionalInt: null,
        };
    }
}
