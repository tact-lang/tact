message(1001) UserMsg {
    val: Int;
}

contract MsgFieldContract {
    m: UserMsg;

    init() {
        self.m = UserMsg{ val: 42 };
    }
}