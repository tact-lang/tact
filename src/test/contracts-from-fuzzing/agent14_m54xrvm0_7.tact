struct Data {
    u4: Int as uint4;
    i8: Int as int8;
    flag: Bool;
    txt: String;
}

contract Test7 {
    data: Data;

    init() {
        self.data = Data{ u4: 7, i8: -8, flag: true, txt: "hi" };
    }
}
