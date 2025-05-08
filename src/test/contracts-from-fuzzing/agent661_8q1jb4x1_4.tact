struct Simple {
    a: Int;
}

contract TestContract {
    one: Simple;
    two: Simple;
    three: Simple;
    four: Simple;
    five: Simple;
    six: Simple;
    seven: Simple;
    eight: Simple;
    nine: Simple;
    ten: Simple;

    init() {
        self.one = Simple{a:1};
        self.two = Simple{a:2};
        self.three = Simple{a:3};
        self.four = Simple{a:4};
        self.five = Simple{a:5};
        self.six = Simple{a:6};
        self.seven = Simple{a:7};
        self.eight = Simple{a:8};
        self.nine = Simple{a:9};
        self.ten = Simple{a:10};
    }
}