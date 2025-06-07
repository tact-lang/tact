struct HasBoolOpt {
    val: Bool?;
}

contract OptBoolInStruct {
    f: HasBoolOpt;

    init() {
        self.f = HasBoolOpt{ val: null };
    }
}