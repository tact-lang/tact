struct Defaulted {
    a: Int = 1;
    b: Bool = true;
    c: Int?; // null by default
    d: Bool?; // null by default
}

contract TestContract {
    val: Defaulted;

    init() {
        self.val = Defaulted{}; // use default/nulls
    }
}