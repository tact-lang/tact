struct Info {
    val: Int = 5;
    note: String?;
}

contract MultiInit {
    optInt: Int? as uint8;
    defaultInfo: Info = Info{ val: 10, note: "hi" };
    optInfo: Info?;

    init() {
        self.optInt = 42;
        self.optInfo = Info{ val: 7, note: null };
    }

    receive() {}
}