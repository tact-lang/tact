struct Arranged {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
}

contract Ordered {
    field: Arranged;

    init() {
        self.field = Arranged{
            a:1,b:"b",c:true,d:2,e:"e",f:false
        };
    }
}