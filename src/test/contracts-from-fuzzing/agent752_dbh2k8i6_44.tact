struct SerialEdge {
    a: Int as uint1;
    b: Int as int2;
    c: Int as uint3;
    d: Int as int4;
    e: Int as uint5;
}

contract SerialEdgeCase {
    s: SerialEdge;
    init() {
        self.s = SerialEdge{ a:1,b:-1,c:3,d:-4,e:5 };
    }
}