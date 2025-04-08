struct ConstNested {
    val: Int;
    flag: Bool;
}

contract ConstStructAsConst {
    const NN: ConstNested = ConstNested{ val: 42, flag: true };
    num: Int;

    init() {
        self.num = self.NN.val;
    }
}