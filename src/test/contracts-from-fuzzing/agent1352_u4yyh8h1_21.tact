message(101) DeepMsg {
    value: Int;
}

message(102) MidMsg {
    deep: DeepMsg;
}

struct TopStruct {
    mid: MidMsg;
}

contract TestContract {
    nestedMsg: TopStruct;

    init() {
        self.nestedMsg = TopStruct{
            mid: MidMsg{ deep: DeepMsg{ value: 42 } }
        };
    }
}
