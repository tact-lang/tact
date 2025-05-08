struct BoolsInts {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
}

contract BoolsIntsContract {
    state: BoolsInts;
    init() {
        self.state = BoolsInts{ b1:true, i1:1, b2:false, i2:42 };
    }
}