contract ManyDefaultVals {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;

    init() {
        self.i1 = 10;
        self.i2 = 20;
        self.i3 = 30;
        self.b1 = false;
        self.b2 = true;
        self.b3 = false;
    }
}