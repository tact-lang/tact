struct Small {
    a: Int as int8;
    b: Int as uint7;
    c: Int as uint4;
    d: Int as int1;
}

contract TestContract {
    data: Small;

    init() {
        self.data = Small{ a:-5, b:5, c:3, d:1 };
    }
}