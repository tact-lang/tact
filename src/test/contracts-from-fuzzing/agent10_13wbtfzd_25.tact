struct OuterTest {
    s1: Int;
    s2: Int;
    s3: Int;
    s4: Int;
    s5: Int;
}

contract NestedOuter {
    foo: OuterTest;
    bar: OuterTest;

    init() {
        self.foo = OuterTest{ s1:1, s2:2, s3:3, s4:4, s5:5 };
        self.bar = OuterTest{ s1:6, s2:7, s3:8, s4:9, s5:10 };
    }
}