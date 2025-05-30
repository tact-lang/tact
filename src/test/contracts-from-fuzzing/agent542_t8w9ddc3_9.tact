struct DeepStruct {
    val: Int = 5;
}

struct ManyOpts {
    optA: Int?;
    optB: String?;
    nestOpt: DeepStruct?;
    flag: Bool = true;
}

contract ComboNulls {
    store: ManyOpts;

    init() {
        self.store = ManyOpts{
            optA: null,
            optB: null,
            nestOpt: null,
            flag: false
        };
    }
}