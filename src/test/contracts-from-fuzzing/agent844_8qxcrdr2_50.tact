struct Slot {
    idx: Int;
    val: String?;
}

contract SparseSlots {
    s1: Slot?;
    s2: Slot?;
    s3: Slot?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }

    receive() {
        let _=self.s1;
        let _=self.s3;
    }
}