// optional of struct with optional field
struct Sub {
    val: Int?;
}

contract OptOpt {
    s: Sub?;

    init() {
        self.s = null;
    }
}