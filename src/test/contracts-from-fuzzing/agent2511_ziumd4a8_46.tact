struct SOpt {
    val: Int?;
}

contract NestedOptDef {
    val: SOpt;

    init() {
        self.val = SOpt{val:null};
    }
}