struct Nullables {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestAllNullInit {
    data: Nullables;
    init() {
        self.data = Nullables{x:null,y:null,z:null};
    }
}
