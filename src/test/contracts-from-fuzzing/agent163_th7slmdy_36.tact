struct Little {
    a: Int;
    b: Bool?;
}

contract OptStructFieldInContractOptional {
    inner: Little?;
    init() {
        self.inner = null;
    }
}