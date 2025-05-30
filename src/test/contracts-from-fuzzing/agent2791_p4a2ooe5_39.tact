struct Sub {
    text: String;
    flag: Bool?;
}

contract StructOptional {
    s: Sub?;

    init() {
        self.s = null;
    }
}
