struct DeeplyNestedOptional {
    first: Outer?;
}

struct Outer {
    second: Mid?;
}

struct Mid {
    third: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    testField: DeeplyNestedOptional;

    init() {
        self.testField = DeeplyNestedOptional{
            first: null
        };
    }
}