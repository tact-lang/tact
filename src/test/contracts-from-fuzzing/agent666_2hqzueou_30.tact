struct Simple {
    val: Int;
}

contract OptMany {
    f1: Simple?;
    f2: Simple?;
    f3: Simple?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
    }
}