struct OptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructOpt {
    s: OptionStruct;

    init() {
        self.s = OptionStruct{ a:null, b: null, c: null };
    }
}