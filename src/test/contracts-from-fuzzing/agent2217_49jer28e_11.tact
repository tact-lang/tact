struct OneField {
    x: Int;
}

struct Many {
    f1: OneField;
    f2: OneField;
    f3: OneField;
    f4: OneField;
    f5: OneField;
    f6: OneField;
}

contract ManyNested {
    big: Many;

    init() {
        self.big = Many{
            f1: OneField{ x: 1 },
            f2: OneField{ x: 2 },
            f3: OneField{ x: 3 },
            f4: OneField{ x: 4 },
            f5: OneField{ x: 5 },
            f6: OneField{ x: 6 }
        };
    }
}
