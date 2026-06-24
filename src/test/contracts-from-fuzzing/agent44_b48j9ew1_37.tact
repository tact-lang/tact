struct S {
    one: Int;
    two: Int?;
}

contract OptStructs {
    x: S?;
    y: S?;

    init() {
        self.x = null;
        self.y = null;
    }

    receive() {
        self.x = S{ one:1, two:null };
    }
}