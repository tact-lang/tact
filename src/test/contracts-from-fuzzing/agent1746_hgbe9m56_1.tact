struct Nested {
    x: Int;
    y: Bool;
    z: String;
    opt: Int?;
}

struct Outer {
    inner1: Nested;
    inner2: Nested;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Nested{x:1,y:true,z:"a",opt:null},
            inner2: Nested{x:2,y:false,z:"b",opt:3},
        };
    }
}
