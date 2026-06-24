struct HasStringOpt {
    foo: String?;
}

contract StringOptionalStorage {
    optstr: String?;
    structField: HasStringOpt;

    init() {
        self.optstr = null;
        self.structField = HasStringOpt{ foo: null };
    }
}
