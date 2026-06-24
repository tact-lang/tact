struct MidNested {
    info: String;
    count: Int;
}

struct TopNested {
    mid: MidNested;
    flag: Bool;
}

contract NestedWithBool {
    val: TopNested;

    init() {
        self.val = TopNested{
            mid: MidNested{
                info: "abc",
                count: 5
            },
            flag: true
        };
    }
}