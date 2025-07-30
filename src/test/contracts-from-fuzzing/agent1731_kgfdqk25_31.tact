struct L {
    val: Int;
}

struct Unbal {
    left: L;
    right: L?;
    mid: L;
}

contract Asym {
    val: Unbal;

    init() {
        self.val = Unbal{
            left: L{ val: 1 },
            right: null,
            mid: L{ val: 2 }
        };
    }
}
