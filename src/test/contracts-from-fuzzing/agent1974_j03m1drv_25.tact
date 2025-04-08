struct Branch {
    l: Int;
    r: Int?;
}

struct Top {
    left: Branch;
    right: Branch;
    extra: Bool;
}

contract Symmetry {
    val: Top;

    init() {
        self.val = Top{
            left: Branch{ l:1, r:null },
            right: Branch{ l:2, r:3 },
            extra: true
        };
    }
}
