// struct using default values
struct DefVals {
    a: Int = 5;
    b: String = "hey";
    c: Bool = true;
}

contract Test29 {
    d: DefVals;

    init() {
        self.d = DefVals{};
    }
}