message(123) Msg {
    val: Int;
}

contract TestContract {
    m: Msg = Msg{ val: 7 };

    init() {
        self.m = Msg{ val: 11 };
    }
}