struct SOpt {
    nested: Int?;
}

contract OptInStructOpt {
    val: SOpt?;

    init() {
        self.val = null;
    }
}