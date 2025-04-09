struct Tiny { a: Int }

contract MultiTiny {
    one: Tiny;
    two: Tiny;
    three: Tiny;
    four: Tiny;
    five: Tiny;

    init() {
        self.one = Tiny{a:1};
        self.two = Tiny{a:2};
        self.three = Tiny{a:3};
        self.four = Tiny{a:4};
        self.five = Tiny{a:5};
    }
}