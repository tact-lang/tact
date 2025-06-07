struct BoolDeep {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolContract {
    val: BoolDeep;

    init() {
        self.val = BoolDeep{ b1:true, b2:false, b3:true, b4:false };
    }
}