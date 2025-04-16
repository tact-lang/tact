struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract BoolPackTest {
    data: MultiBool;

    init() {
        self.data = MultiBool{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false
        };
    }
}