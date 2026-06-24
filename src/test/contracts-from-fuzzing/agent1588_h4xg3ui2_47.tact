struct SparseOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptSparsePersist {
    val: SparseOpt?;
    init() {
        self.val = null;
    }
}