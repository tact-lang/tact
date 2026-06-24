struct MixOrder {
    opt1: Int?;
    val: Int;
    opt2: Int? = null;
    flag: Bool;
    defBool: Bool = false;
}

contract Test {
    x: MixOrder;

    init() {
        self.x = MixOrder{ val: 7, flag: true };
    }
}