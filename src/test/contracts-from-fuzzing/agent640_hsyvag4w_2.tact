struct Inner {
    one: Int;
    two: Bool?;
    three: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    flag: Bool;
}

contract TestFuzz {
    val: Outer;

    init() {
        self.val = Outer{
            inner1: Inner{one: 1, two: null, three: "x"},
            inner2: Inner{one: 2, two: true, three: "y"},
            flag: true,
        };
    }
}