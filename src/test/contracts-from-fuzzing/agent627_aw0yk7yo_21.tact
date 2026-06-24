struct NestedOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test {
    f1: NestedOpt?;
    f2: NestedOpt?;
    init() {
        self.f1 = null;
        self.f2 = NestedOpt{x:null, y:true, z:null};
    }
}