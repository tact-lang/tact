struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Int?;
    inner5: Bool?;
    inner6: String?;
}

struct Outer {
    nested1: BigNested;
    nested2: BigNested;
    nested3: BigNested;
}

contract BigNestedContract {
    container: Outer;

    init() {
        self.container = Outer{
            nested1: BigNested{
                inner1: 1,
                inner2: true,
                inner3: "a",
                inner4: null,
                inner5: false,
                inner6: null,
            },
            nested2: BigNested{
                inner1: 2,
                inner2: false,
                inner3: "b",
                inner4: 20,
                inner5: null,
                inner6: "test",
            },
            nested3: BigNested{
                inner1: 3,
                inner2: true,
                inner3: "c",
                inner4: 30,
                inner5: null,
                inner6: null,
            },
        };
    }
}