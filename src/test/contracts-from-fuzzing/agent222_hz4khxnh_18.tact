struct SInner {
    optI: Int?;
    optB: Bool?;
}

contract NullDefaultsOnly {
    val: SInner = SInner{optI: null, optB: null};

    receive() {
        self.val = SInner{optI: null, optB: true};
    }
}