struct ComplexOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptDeep {
    val: ComplexOpt? = null;

    receive() {
        self.val = ComplexOpt{
            i: 321,
            b: false,
            s: "deep opt"
        };
    }
}