struct Level {
    a: Int;
    b: String;
}

contract ArrayOfStructsKind {
    s1: Level;
    s2: Level;
    s3: Level;

    init() {
        self.s1 = Level{a:1, b:"a"};
        self.s2 = Level{a:2, b:"b"};
        self.s3 = Level{a:3, b:"c"};
    }
}
