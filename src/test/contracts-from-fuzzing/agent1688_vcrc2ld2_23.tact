message(101) MsgData {
    val: Int;
    note: String;
}

contract TestContract {
    data: MsgData;

    init() {
        self.data = MsgData{val:5, note:"note"};
    }
}