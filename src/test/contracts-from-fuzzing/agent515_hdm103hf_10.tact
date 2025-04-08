struct HasManyOpts {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;
    o6: Bool?;
}

contract ContractManyOpts {
    f: HasManyOpts;

    init() {
        self.f = HasManyOpts{
            o1: null,
            o2: null,
            o3: 3,
            o4: true,
            o5: null,
            o6: false
        };
    }
}
