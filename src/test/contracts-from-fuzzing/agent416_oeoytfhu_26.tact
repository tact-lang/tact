struct Filled {
    i1: Int;
    i2: Int;
    i3: Int;
    b1: Bool;
    b2: Bool;
}

contract Test26 {
    val: Filled;

    init() {
        self.val = Filled{ i1:1, i2:2, i3:3, b1:true, b2:false };
    }
}
