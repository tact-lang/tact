struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedInits {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{a:null,b:null,c:null};
    }
}