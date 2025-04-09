struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract ContractManyOptions {
    f: ManyOptions;

    init() {
        self.f = ManyOptions{a:null, b:null, c:null, d:null, e:null};
    }
}