struct Inner {
    val: Int = 5;
}

contract ParamsDefault {
    pers: Inner;
    init() {
        self.pers = Inner{};
    }
}