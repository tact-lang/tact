struct DeepOpt {
    inner: Int?;
}

contract OptState {
    val: DeepOpt?;

    init() {
        self.val = DeepOpt{ inner: null };
    }
}