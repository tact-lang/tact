struct Inner {
    a: Int;
    b: Bool?;
    s: String;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Inner?;
}

contract NestedTest {
    data: Outer = Outer{
        x: 10,
        y: Inner{a:1, b:true, s:"x"},
        z: null
    };

    init() {
        self.data = Outer{
            x: 1,
            y: Inner{a:10, b:null, s:"ok"},
            z: Inner{a:0,b:false,s:"!"}
        };
    }
}