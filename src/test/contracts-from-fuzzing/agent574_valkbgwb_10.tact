struct L3 {
    val: Int?;
}

struct L2 {
    l3: L3?;
}

struct L1 {
    l2: L2?;
}

contract DeepOptionalChain {
    pers: L1?;

    init() {
        self.pers = null;
    }

    receive() {
        if (self.pers != null && self.pers!!.l2 != null && self.pers!!.l2!!.l3 != null && self.pers!!.l2!!.l3!!.val != null) {
            dump(self.pers!!.l2!!.l3!!.val!!);
        }
    }
}