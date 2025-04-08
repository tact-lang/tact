contract TestContract {
    x: Int = 1;
    y: Bool = false;
    s: String = "init";
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;

    init() {
        self.x = 2;
        self.y = true;
        self.s = "after";
        self.o1 = 3;
        self.o2 = true;
        self.o3 = "set";
    }

    receive() {
        self.x = 4;
    }
}