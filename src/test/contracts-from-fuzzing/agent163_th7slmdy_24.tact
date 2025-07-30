struct OptIntStr {
    val: Int?;
    txt: String;
}

contract OptStructField {
    data: OptIntStr?;

    init() {
        self.data = null;
    }
}