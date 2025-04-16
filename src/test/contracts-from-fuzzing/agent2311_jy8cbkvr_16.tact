struct BigNested1 {
    v1: Int;
    v2: Bool;
    v3: String;
}

struct BigNested2 {
    a: BigNested1;
    b: BigNested1;
    c: BigNested1;
    d: BigNested1;
}

contract BigNestTest {
    x: BigNested2;

    init() {
        self.x = BigNested2{
            a: BigNested1{v1:1,v2:true,v3:"a"},
            b: BigNested1{v1:2,v2:false,v3:"b"},
            c: BigNested1{v1:3,v2:true,v3:"c"},
            d: BigNested1{v1:4,v2:false,v3:"d"}
        };
    }
}