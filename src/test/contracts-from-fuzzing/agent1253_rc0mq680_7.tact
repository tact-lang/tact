struct BoolFirst {
    flag: Bool;
    num: Int;
}

contract Test {
    val: BoolFirst;

    init() {
        self.val = BoolFirst{ flag:true, num:42 };
    }
}
