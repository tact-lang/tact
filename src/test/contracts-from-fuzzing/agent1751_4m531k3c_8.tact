struct SparseVec {
    item0: Int?;
    item1: Int?;
    item2: Int?;
    item3: Int?;
}

contract SparseStorage {
    vec: SparseVec;

    init() {
        self.vec = SparseVec{
            item0: 1,
            item1: null,
            item2: 3,
            item3: null,
        };
    }

    receive() {}
}