struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    first: Inner; 
    second: Inner;
}

contract NestedStructs {
    pair: Outer;

    init() {
        self.pair = Outer{
            first: Inner{x:1, y:null},
            second: Inner{x:2, y:"hello"}
        };
    }
}
