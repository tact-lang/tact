struct WithBool {
    flag: Bool;
}

struct WithOptStruct {
    nested: WithBool?;
    comment: String;
}

contract OptStructTest {
    data: WithOptStruct;

    init() {
        self.data = WithOptStruct{
            nested: WithBool{flag: true},
            comment: "test"
        };
    }
}