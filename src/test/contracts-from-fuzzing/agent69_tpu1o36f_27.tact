struct AB {
    a: Int;
    b: String;
}

contract ArrayOfStructs {
    x1: AB;
    x2: AB;
    x3: AB;

    init() {
        self.x1 = AB{ a:1, b:"a" };
        self.x2 = AB{ a:2, b:"b" };
        self.x3 = AB{ a:3, b:"c" };
    }
}