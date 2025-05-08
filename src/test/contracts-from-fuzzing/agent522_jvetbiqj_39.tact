struct SOpt {
    f: Bool?;
}

contract OptStructField {
    val: SOpt?;

    init() {
        self.val = SOpt{ f: null };
    }
}