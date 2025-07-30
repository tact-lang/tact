struct BoolFirst {
    flag: Bool;
    x: Int;
}

contract BoolFirstContract {
    val: BoolFirst;
    init() {
        self.val = BoolFirst{flag:true, x:777};
    }
}