struct Repeater {
    a: Int;
    b: Int;
}

contract TestContract {
    f1: Repeater;
    f2: Repeater;
    f3: Repeater;
    f4: Repeater;
    f5: Repeater;
    f6: Repeater;

    init() {
        self.f1 = Repeater{ a:1, b:2 };
        self.f2 = Repeater{ a:3, b:4 };
        self.f3 = Repeater{ a:5, b:6 };
        self.f4 = Repeater{ a:7, b:8 };
        self.f5 = Repeater{ a:9, b:10 };
        self.f6 = Repeater{ a:11, b:12 };
    }
}