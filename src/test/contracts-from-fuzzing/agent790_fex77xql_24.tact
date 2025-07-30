struct Inner {
    i: Int;
    s: String;
}

struct Outer {
    a: Int;
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract ManyNested {
    val: Outer;

    init() {
        self.val = Outer{
            a: 0,
            in1: Inner{i:1, s:"a"},
            in2: Inner{i:2, s:"b"},
            in3: Inner{i:3, s:"c"}
        };
    }
}