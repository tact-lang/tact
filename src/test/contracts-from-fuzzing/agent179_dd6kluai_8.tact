message(1) SetVal {
    v: Int;
}

contract TestContract {
    m: SetVal? = null;

    init() {
        self.m = SetVal{ v: 42 };
    }
}