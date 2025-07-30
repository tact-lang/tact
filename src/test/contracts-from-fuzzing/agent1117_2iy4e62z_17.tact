struct Serial {
    id: Int as uint32;
    num: Int as int64;
    value: Int;
    flag: Bool;
    note: String;
}

contract HasSerial {
    data: Serial;

    init() {
        self.data = Serial{
            id: 10,
            num:20,
            value:30,
            flag:true,
            note:"ok"
        };
    }
}
