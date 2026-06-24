struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DeepOptFields {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{ a:null, b:true, c:null };
    }
}