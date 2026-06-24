struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{a:1,b:true,c:"x"},
            y: Inner{a:2,b:false,c:"y"},
            z: Inner{a:3,b:true,c:"z"}
        };
    }
}