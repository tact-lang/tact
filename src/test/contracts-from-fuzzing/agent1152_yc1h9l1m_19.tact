struct DeepOpt {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract Test {
    rec: DeepOpt;

    init() {
        self.rec = DeepOpt{x:null,y:2,z:null};
    }
}