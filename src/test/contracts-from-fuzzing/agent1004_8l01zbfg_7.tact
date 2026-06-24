struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract TestContract {
    bigStruct: Outer;

    init() {
        self.bigStruct = Outer{
            one: Inner{ a:1, b:true, c:"a" },
            two: Inner{ a:2, b:false, c:"b" },
            three: Inner{ a:3, b:true, c:"c" }
        };
    }
}