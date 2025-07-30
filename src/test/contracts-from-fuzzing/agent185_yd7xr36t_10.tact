struct ListOrderA {
    a: Int;
    b: Bool;
    c: String;
}

struct ListOrderB {
    c: String;
    a: Int;
    b: Bool;
}

contract OrderTest {
    dataA: ListOrderA;
    dataB: ListOrderB;
    init() {
        self.dataA = ListOrderA{ a:1, b:true, c:"c" };
        self.dataB = ListOrderB{ c:"c", a:1, b:true };
    }
}
