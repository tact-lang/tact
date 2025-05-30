struct BoolEdge {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract EightBoolsPacked {
    data: BoolEdge;

    init() {
        self.data = BoolEdge{
            a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true
        };
    }
}