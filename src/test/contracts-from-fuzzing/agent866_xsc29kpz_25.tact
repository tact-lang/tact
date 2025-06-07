struct SA {
    a: Int;
}

struct SB {
    b: Int;
}

struct SC {
    c: Int;
}

contract MultiStructs {
    val1: SA;
    val2: SB;
    val3: SC;
    init() {
        self.val1 = SA{ a:1 };
        self.val2 = SB{ b:2 };
        self.val3 = SC{ c:3 };
    }
}