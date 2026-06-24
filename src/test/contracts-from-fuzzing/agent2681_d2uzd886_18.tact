struct SOpt {
    foo: Bool?;
    bar: Int?;
}

contract OptInsideStructOpt {
    val: SOpt?;

    init() {
        self.val = null;
    }
}