struct IntsBools {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
}

contract Test {
    data: IntsBools;

    init() {
        self.data = IntsBools{
            a:1,b:true,c:2,d:false,e:3
        };
    }
}