struct X { a: Int; b: String; c: Bool; }
struct Y { d: Int; e: String; f: Bool; }

struct Many {
    x: X;
    y: Y;
    xx: X;
    yy: Y;
}

contract Test {
    m: Many = Many{
        x: X{ a:1,b:"a",c:true },
        y: Y{ d:2,e:"b",f:false },
        xx: X{ a:3,b:"c",c:false },
        yy: Y{ d:4,e:"d",f:true }
    };
}