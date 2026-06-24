struct InnerBoolOpt {
    b: Bool?;
}

contract TopLevelOpt {
    f: InnerBoolOpt;

    init() {
        self.f = InnerBoolOpt{ b: null };
    }
}