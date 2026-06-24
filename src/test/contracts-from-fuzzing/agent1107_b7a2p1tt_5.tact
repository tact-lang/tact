struct OptNest {
    innerOpt: Int?;
    textOpt: String?;
}

struct HasOpts {
    sOpt: OptNest?;
    flag: Bool;
}

contract OptionalStorage {
    deepOpt: HasOpts;
    
    init() {
        self.deepOpt = HasOpts{
            sOpt: null,
            flag: true
        };
    }
}