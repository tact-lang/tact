struct Msg {
    value: Int;
    status: Bool;
}

contract InlineStructFields {
    msg: Msg;
    number: Int;
    flag: Bool;
    note: String;

    init() {
        self.msg = Msg{ value:10, status:true };
        self.number = 20;
        self.flag = false;
        self.note = "hello";
    }
}