struct SOpt {
    optInt: Int?;
}

contract Test36 {
    inner: SOpt;
    outerOpt: SOpt?;

    init() {
        self.inner = SOpt{ optInt:null };
        self.outerOpt = null;
    }
}
