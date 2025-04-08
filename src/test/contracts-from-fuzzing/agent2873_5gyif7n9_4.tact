struct Inner1 {
    flag: Bool;
}

struct Inner2 {
    s: String;
}

struct Inner3 {
    num: Int;
}

struct Outer {
    in1: Inner1;
    in2: Inner2;
    in3: Inner3;
}

contract NestedMultiContract {
    outer: Outer;
    init() {
        self.outer = Outer{
            in1: Inner1{flag: true},
            in2: Inner2{s: "abc"},
            in3: Inner3{num: 5}
        };
    }
}