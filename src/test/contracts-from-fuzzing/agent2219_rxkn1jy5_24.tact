struct NestedBool {
    b1: Bool;
    b2: Bool;
}

contract BoolNested {
    n: NestedBool;

    init() {
        self.n = NestedBool{ b1:true, b2:false };
    }
}