struct SOpt {
    val: Int?;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String?;
    f4: SOpt?;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = null;
        self.f4 = null;
    }
}