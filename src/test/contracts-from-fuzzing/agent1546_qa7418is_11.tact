struct S {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptStructNested {
    innerOpt: S?;

    init() {
        self.innerOpt = null;
    }
}
