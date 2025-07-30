struct TripleOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptDefaults {
    rec: TripleOpt = TripleOpt{x:null,y:null,z:null};
}