struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }

struct Outer {
    first: Inner1;
    second: Inner2;
    flag: Bool;
}

contract MixedInnerStructs {
    snapshot: Outer;

    init() {
        self.snapshot = Outer{
            first: Inner1{a:10},
            second: Inner2{b:false},
            flag: true
        };
    }
}