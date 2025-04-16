message(0x02) SomeMsg {
    num: Int;
    txt: String;
}

contract TestContract {
    optMsg: SomeMsg?;

    init() {
        self.optMsg = SomeMsg{
            num: 5,
            txt: "hi",
        };
    }
}