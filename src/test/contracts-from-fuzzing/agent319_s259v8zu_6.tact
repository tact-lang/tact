struct InnerOpt {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract TestContract {
    p: InnerOpt;

    init() {
        self.p = InnerOpt{x:null, y:null, z:null};
    }
}