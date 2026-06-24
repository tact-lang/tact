struct S {
    x: Int?;
    y: Bool?;
    z: String?;
}
contract NilFields {
    f: S = S{x:null, y:null, z:null};
}