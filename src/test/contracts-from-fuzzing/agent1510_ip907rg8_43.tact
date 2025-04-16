struct ManyOptionBool {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract OptionBoolFields {
    f: ManyOptionBool;

    init() {
        self.f = ManyOptionBool{a:null, b:true, c:null};
    }
}