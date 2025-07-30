struct Strings {
    a: String;
    b: String;
    c: String;
}

contract ManyStrings {
    vals: Strings = Strings{ a:"1",b:"2",c:"3" };

    init() {
        self.vals = self.vals;
    }

    receive() {
        self.vals = self.vals;
    }
}