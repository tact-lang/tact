struct SOptNested {
    a: Int?;
    b: String?;
}
struct SOpt {
    sn: SOptNested?;
    c: Bool?;
}

contract TwoLevelOptionals {
    d: SOpt?;
    init() {
        self.d = null;
    }
    receive() {}
}