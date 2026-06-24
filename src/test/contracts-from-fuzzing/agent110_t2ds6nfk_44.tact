struct PartOpt {
    a: Int?;
    b: Bool;
}

contract PartialAssign {
    st: PartOpt;
    init() {
        self.st = PartOpt{ b: false };
    }
}