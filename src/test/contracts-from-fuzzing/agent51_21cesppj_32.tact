struct DeeplyOptional {
    sub: Int?;
}

contract OptOptOpt {
    deeply: DeeplyOptional?;

    init() {
        self.deeply = null;
    }
}