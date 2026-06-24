struct DeepOpt {
    a: Int?;
    b: Bool?;
}

contract StructWithOptionalFields {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{ a:null, b:true };
    }
}