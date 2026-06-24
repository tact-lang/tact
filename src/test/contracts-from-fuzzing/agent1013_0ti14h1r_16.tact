struct Sparse {
    i: Int;
    j: Int?;
    k: Int;
    s: String?;
    flag: Bool;
    t: String;
}

contract SparseFields {
    sf: Sparse;

    init() {
        self.sf = Sparse{ i:1, j:null, k:2, s:null, flag:false, t:"hello" };
    }
}
