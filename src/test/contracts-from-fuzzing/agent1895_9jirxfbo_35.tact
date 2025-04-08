struct SubWrap {
    num: Int;
    flag: Bool;
}

struct MainWrap {
    sw: SubWrap;
    desc: String;
    opt: Int?;
}

contract NestedComposite {
    store: MainWrap;
    init() {
        self.store = MainWrap{
            sw: SubWrap{ num: 1, flag:true },
            desc: "description",
            opt: null
        };
    }
}