message InputMsg {
    val: Int;
    flag: Bool;
}

struct Wrapper {
    msg: InputMsg;
    text: String;
}

contract TestContract {
    data: Wrapper = Wrapper{ msg: InputMsg{ val:1, flag:false }, text: "hi" };
    init() {}
}
