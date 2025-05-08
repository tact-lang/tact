struct Param {
    flag: Bool;
    count: Int;
    note: String;
}

contract Test {
    data: Param;
    init() {
        self.data = Param{flag:false, count:0, note:""};
    }
}