struct Inner {
    x: Int = 111;
    y: Int?;
}

struct Outer {
    n: Inner?;
    z: Int = 5;
}

contract Tester {
    o: Outer;

    init() {
        self.o = Outer{ n: null, z: 55 };
    }
}