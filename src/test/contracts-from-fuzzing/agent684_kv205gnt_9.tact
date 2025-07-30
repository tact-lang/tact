struct Strings {
    first: String;
    second: String;
    third: String;
}

contract TestContract {
    s: Strings;

    init() {
        self.s = Strings {
            first: "hello",
            second: "world",
            third: "!"
        };
    }

    receive() {
        dump(self.s.first);
        dump(self.s.second);
        dump(self.s.third);
    }
}
