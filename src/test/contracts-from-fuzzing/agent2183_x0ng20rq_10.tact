struct InnerNested {
    f: Int;
}

struct Nested {
    x: String;
    inr: InnerNested;
}

struct Top {
    first: Int;
    nest: Nested;
    flag: Bool;
}

contract StorageTest {
    s: Top;

    init() {
        self.s = Top{
            first: 5,
            nest: Nested{
                x: "abc",
                inr: InnerNested{
                    f: 123
                }
            },
            flag: true
        };
    }
}