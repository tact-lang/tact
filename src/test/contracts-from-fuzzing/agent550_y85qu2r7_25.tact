struct BigNested {
    a: Int; b: Int; c: Int;
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    x: Int; y: Int; z: Int;
}

contract BigTest {
    val: BigNested;

    init() {
        self.val = BigNested{
            a:1,b:2,c:3,
            inner1: Inner{x:4,y:5,z:6},
            inner2: Inner{x:7,y:8,z:9}
        };
    }
}