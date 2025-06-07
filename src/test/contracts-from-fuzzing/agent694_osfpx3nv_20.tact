struct BoolSeries {
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

contract TestContract {
    s: BoolSeries;

    init() {
        self.s = BoolSeries{
            a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true,i:true,j:true
        };
    }
}