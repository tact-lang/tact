struct Simple {
    num: Int;
}

contract TestContract {
    f1: Simple;
    f2: Simple;
    f3: Simple;
    f4: Simple;
    f5: Simple;

    init() {
        self.f1 = Simple{num:1};
        self.f2 = Simple{num:2};
        self.f3 = Simple{num:3};
        self.f4 = Simple{num:4};
        self.f5 = Simple{num:5};
    }
}