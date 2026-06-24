struct DeeplyNested {
    s1: String;
    inner: Nested;
}

struct Nested {
    s2: String;
    innerMost: Smaller;
}

struct Smaller {
    val: Int;
}

contract ManyNestings {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            s1: "a",
            inner: Nested{
                s2: "b",
                innerMost: Smaller{
                    val: 42
                }
            }
        };
    }
}