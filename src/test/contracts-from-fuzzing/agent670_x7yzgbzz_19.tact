struct DeepOpt {
    inner: Int?;
}

contract OptContract {
    val: DeepOpt?;

    init() {
        self.val = null;
    }
}