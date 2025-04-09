struct InnerOpt {
    x: Int?;
    flag: Bool;
}

contract OptStructPersist {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}
