// Large combination of nested non-optional primitive fields
struct I3 {
    a: Int;
    b: Bool;
    c: String;
}

struct I2 {
    x: I3;
    y: I3;
}

struct I1 {
    l: I2;
    r: I2;
}

contract WideNested {
    root: I1;

    init() {
        self.root = I1{
            l: I2{ x: I3{a:1,b:true,c:"a"}, y: I3{a:2,b:false,c:"b"} },
            r: I2{ x: I3{a:3,b:false,c:"c"}, y: I3{a:4,b:true,c:"d"} }
        };
    }
}
