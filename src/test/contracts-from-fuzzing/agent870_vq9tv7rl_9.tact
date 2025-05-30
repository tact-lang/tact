struct EmptyOptStr {
    s: String?;
}

struct Wrapper {
    w: EmptyOptStr;
    flag: Bool;
}

contract StructWithSubs {
    content: Wrapper = Wrapper{
        w: EmptyOptStr{ s: null },
        flag: false
    };

    init() {
        self.content = Wrapper{
            w: EmptyOptStr{ s: "abc" },
            flag: true
        };
    }
}
