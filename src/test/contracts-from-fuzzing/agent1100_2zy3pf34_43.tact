struct SOpt {
    x: Int?;
}

contract StructWithOpt {
    val: SOpt;

    init() {
        self.val = SOpt{ x:null };
    }
}
