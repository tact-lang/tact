struct DeepStructOpt {
    inner: Int?;
}

contract UseDeepStructOpt {
    s: DeepStructOpt?;
    init() {
        self.s = null;
    }
}