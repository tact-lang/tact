struct OptStr {
    val: String?;
}

contract NilStringOptional {
    s: OptStr;

    init() {
        self.s = OptStr{ val: null };
    }
}