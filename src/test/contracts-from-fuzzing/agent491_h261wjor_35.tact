struct End {
    val: Int;
}

struct Mid {
    end: End;
}

contract StructChain {
    mid: Mid;
    init() {
        self.mid = Mid{ end: End{ val: 77 } };
    }
}