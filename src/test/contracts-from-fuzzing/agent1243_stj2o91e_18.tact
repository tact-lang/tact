contract TestContract {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;

    init() {
        self.b1 = false;
        self.b2 = true;
        self.b3 = false;
        self.b4 = true;
        self.b5 = false;
    }

    receive() {
        dump(self.b1);
    }
}