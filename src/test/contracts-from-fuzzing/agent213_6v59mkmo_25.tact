contract Boo {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool = true;

    get fun check(): Int {
        if (self.f1 && !self.f2 && self.f3) {
            return 1;
        }
        return 0;
    }
}