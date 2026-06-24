struct Packed {
    one: Int as uint4;
    two: Int as int16;
    txt: String;
    flg: Bool;
}

contract TestContract {
    data: Packed;
    init() {
        self.data = Packed{
            one: 7,
            two: -123,
            txt: "abc",
            flg: true
        };
    }
}
