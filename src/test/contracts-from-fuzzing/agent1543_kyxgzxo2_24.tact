message(0xCAFE) Greet {
    val: Int = 1;
}

contract TestContract {
    g: Greet;
    init() {
        self.g = Greet{ val: 42 };
    }
}