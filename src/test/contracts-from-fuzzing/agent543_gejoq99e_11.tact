struct NestedMultiOpt {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

contract NestedMultiOptStorage {
    st: NestedMultiOpt;

    init() {
        self.st = NestedMultiOpt{ aa:null, bb:null, cc:null };
    }
}
