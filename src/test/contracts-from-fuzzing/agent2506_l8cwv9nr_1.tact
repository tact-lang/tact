struct Nest2 {
    id: Int;
    name: String;
}

struct Nest1 {
    flag: Bool;
    sub: Nest2;
}

struct Root {
    nested: Nest1;
    amount: Int;
}

contract DeepNestTest {
    rootData: Root;

    init() {
        self.rootData = Root{
            nested: Nest1{
                flag: false,
                sub: Nest2{
                    id: 42,
                    name: "deep",
                }
            },
            amount: 24,
        };
    }
}
