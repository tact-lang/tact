struct DataA {
    n: Int;
    flag: Bool;
}

struct DataB {
    text: String;
    val: Int?;
}

contract StructFields {
    sa: DataA;
    sa_opt: DataA?;
    sb: DataB;
    sb_opt: DataB?;

    init() {
        self.sa = DataA{n: 1, flag: true};
        self.sa_opt = null;
        self.sb = DataB{text: "abc", val: null};
        self.sb_opt = null;
    }
}