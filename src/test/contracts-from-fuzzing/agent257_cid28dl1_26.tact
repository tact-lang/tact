message(42) MyMsg { x: Int; }

contract HoldsMsgStruct {
    m: MyMsg = MyMsg{ x:7 };
    init() {}
}