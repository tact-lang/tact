struct DeeplyNested {
    a: Int;
    b: Int;
}

struct Middle {
    nested: DeeplyNested;
    flag: Bool;
}

struct Top {
    mid: Middle;
    note: String;
}

contract DeepNestedContract {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                nested: DeeplyNested{ a: 10, b: 20 },
                flag: true
            },
            note: "hello"
        };
    }
}