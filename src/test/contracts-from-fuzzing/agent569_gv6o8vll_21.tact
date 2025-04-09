struct AAA { x: Int; y: Int; }
struct BBB { z: Int; }

contract ManyStructMembers {
    a: AAA;
    b: BBB;
    c: AAA;
    d: BBB;

    init() {
        self.a = AAA{x:1,y:2};
        self.b = BBB{z:3};
        self.c = AAA{x:4,y:5};
        self.d = BBB{z:6};
    }
}