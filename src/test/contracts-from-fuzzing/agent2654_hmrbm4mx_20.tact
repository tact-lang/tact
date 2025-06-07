struct NestedDeeply {
    x: Int;
}

struct WrapperLevel2 {
    inner: NestedDeeply;
    s: String;
}

struct WrapperLevel1 {
    lvl2: WrapperLevel2;
    flag: Bool;
}

contract MultiLevelNested {
    w1: WrapperLevel1;

    init() {
        self.w1 = WrapperLevel1{
            lvl2: WrapperLevel2{
                inner: NestedDeeply{x: 5},
                s: "hello"
            },
            flag: true
        };
    }
}