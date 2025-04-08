struct DeepNest {
    id: Int;
    sub: SubNest;
}

struct SubNest {
    flag: Bool;
    text: String;
}

contract NestTest {
    data: DeepNest;
    init() {
        self.data = DeepNest{
            id: 42,
            sub: SubNest{
                flag: true,
                text: "t"
            }
        };
    }
}