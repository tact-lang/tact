struct SparseOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract SparseOptContract {
    val: SparseOpt;

    init() {
        self.val = SparseOpt{a:null,b:null,c:null,d:null,e:null};
    }
}