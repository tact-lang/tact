contract ModifyTest {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
    }

    // Getter that modifies a
    get fun modifyA(): Int {
        self.a = self.a + 10;
        return self.a;
    }

    // Getter that conditionally modifies b
    get fun modifyB(): Int {
        if (self.b < 10) {
            self.b = self.b * 2;
        } else {
            self.b = self.b - 2;
        }
        return self.b;
    }

    // Getter that only reads values
    get fun noModify(): Int {
        return self.a + self.b;
    }
}
