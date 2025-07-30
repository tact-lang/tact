struct NestedOpt {
    xx: Int?;
    yy: Bool?;
    zz: String?;
}

contract NullStructs {
    n1: NestedOpt?;
    n2: NestedOpt?;

    init() {
        self.n1 = null;
        self.n2 = null;
    }

    receive() {
        self.n2 = NestedOpt{ xx:2, yy:true, zz:null };
    }
}