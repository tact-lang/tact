message InnerMsg {
    val: Int?;
}

struct Wrapper1 {
    msg: InnerMsg;
    flag: Bool;
}

message MidMsg {
    wrap1: Wrapper1;
    txt: String?;
}

struct TopStruct {
    mid: MidMsg;
    count: Int;
}

contract TestContract {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            mid: MidMsg{
                wrap1: Wrapper1{ msg: InnerMsg{ val: null }, flag: true },
                txt: null
            },
            count: 7
        };
    }
}