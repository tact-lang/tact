struct AAA {
    a: Int;
    b: Int;
    c: Int;
}

struct BBB {
    x: Int;
    y: Bool;
    z: AAA;
}

contract TestContract {
    bbb: BBB;

    init() {
        self.bbb = BBB{
            x: 1,
            y: false,
            z: AAA{a:2,b:3,c:4}
        };
    }
}