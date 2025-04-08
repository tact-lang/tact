struct Subset {
    n: Int;
    opt: Int?;
}

contract AssignNullThenVal {
    s: Subset;

    init() {
        self.s = Subset{n:1,opt:null};
        self.s = Subset{n:2,opt:5};
    }
}