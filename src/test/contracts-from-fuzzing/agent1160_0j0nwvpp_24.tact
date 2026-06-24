struct DeepTest {
    x: Int;
    y: Int;
    z: Int;
}

struct OuterMost {
    one: DeepTest;
    two: DeepTest;
    three: DeepTest;
}

contract ManyDeepCopies {
    store: OuterMost;

    init() {
        self.store = OuterMost{
            one: DeepTest{x:1,y:2,z:3},
            two: DeepTest{x:4,y:5,z:6},
            three: DeepTest{x:7,y:8,z:9}
        };
    }
}