struct BoolNest {
    b1: Bool;
    b2: Bool?;
}

contract Test {
    field: BoolNest;

    init() {
        self.field = BoolNest{ b1:true, b2:null };
    }
}