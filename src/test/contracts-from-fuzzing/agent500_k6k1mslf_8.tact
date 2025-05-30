struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract NestedLarge {
    val: Outer;

    init() {
        self.val = Outer{
            in1: Inner{ a:1, b:true, c:"a", d:myAddress() },
            in2: Inner{ a:2, b:false, c:"b", d:myAddress() },
            in3: Inner{ a:3, b:true, c:"c", d:myAddress() }
        };
    }
}