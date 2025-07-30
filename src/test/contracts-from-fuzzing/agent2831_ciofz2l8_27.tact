struct InnerDefOpt {
    a: Int? = 1;
    b: String? = "x";
}

contract LayeredOptionalDefaults {
    val: InnerDefOpt? = null;

    init() {
        self.val = null;
    }
}
