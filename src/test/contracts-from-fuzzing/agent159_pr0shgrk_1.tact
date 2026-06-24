struct Nested {
    level1: Inner1;
}

struct Inner1 {
    intField: Int;
    boolField: Bool;
    inner2: Inner2;
}

struct Inner2 {
    stringField: String;
    optField: Bool?;
}

contract DeepNestTest {
    storage: Nested;

    init() {
        self.storage = Nested{
            level1: Inner1{
                intField: 1,
                boolField: true,
                inner2: Inner2{
                    stringField: "nested",
                    optField: null,
                },
            },
        };
    }
}