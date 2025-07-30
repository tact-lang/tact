struct X {
    s: String;
    b: Bool;
}

struct Outer {
    first: X;
    second: X;
}

contract DupeStruct {
    val: Outer;

    init() {
        self.val = Outer{
            first: X{s:"a",b:true},
            second: X{s:"b",b:false},
        };
    }
}
