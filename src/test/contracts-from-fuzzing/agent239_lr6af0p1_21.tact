struct BoolLayer {
    f: Bool;
    o: Bool?;
}

struct NestedBools {
    inner: BoolLayer;
}

contract NestedBoolsContract {
    val: NestedBools;

    init() {
        self.val = NestedBools{ inner: BoolLayer{ f:true, o:null } };
    }
}