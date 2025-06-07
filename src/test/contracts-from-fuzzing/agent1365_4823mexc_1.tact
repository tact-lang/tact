struct NestedLevel3 {
    a: Int;
    b: Bool;
}

struct NestedLevel2 {
    c: NestedLevel3;
    d: String;
    e: Int?;
}

struct NestedLevel1 {
    f: NestedLevel2;
    g: Bool?;
}

contract DeepNestContract {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            f: NestedLevel2{
                c: NestedLevel3{
                    a: 1,
                    b: true,
                },
                d: "hello",
                e: null,
            },
            g: false,
        };
    }
}