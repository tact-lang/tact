struct PackedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptPacked {
    data: PackedOpt;

    init() {
        self.data = PackedOpt{a:null,b:null,c:null};
    }
}
