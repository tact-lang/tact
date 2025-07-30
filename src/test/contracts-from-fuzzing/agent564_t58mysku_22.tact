// Deep nested layered optional complex struct
struct Leaf {
    num: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract DeepOpt {
    top: Top?;
    init() {
        self.top = Top { mid: Mid { leaf: Leaf { num: 7 } } };
    }
    receive() {
        if (self.top != null && self.top!!.mid != null && self.top!!.mid!!.leaf != null) {
            let _ = self.top!!.mid!!.leaf!!;
        }
    }
}