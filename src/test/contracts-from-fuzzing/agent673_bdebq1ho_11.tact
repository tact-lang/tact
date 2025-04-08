struct Tester {
    a: Int;
    b: Int;
}

contract ManyVariables {
    x1: Tester;
    x2: Tester;
    x3: Tester;
    x4: Tester;
    x5: Tester;
    x6: Tester;
    x7: Tester;
    x8: Tester;
    x9: Tester;
    x10: Tester;

    init() {
        self.x1 = Tester{ a:1, b:2 };
        self.x2 = Tester{ a:3, b:4 };
        self.x3 = Tester{ a:5, b:6 };
        self.x4 = Tester{ a:7, b:8 };
        self.x5 = Tester{ a:9, b:10 };
        self.x6 = Tester{ a:11, b:12 };
        self.x7 = Tester{ a:13, b:14 };
        self.x8 = Tester{ a:15, b:16 };
        self.x9 = Tester{ a:17, b:18 };
        self.x10 = Tester{ a:19, b:20 };
    }
}