struct SInner {
    val: Int;
    flag: Bool;
}

contract Arranged {
    s1: SInner;
    s2: SInner;

    init() {
        self.s1 = SInner{ val: 5, flag: true };
        self.s2 = SInner{ val: 7, flag: false };
    }

    receive() {
        let _ = self.s2.val;
    }
}