struct BoolsInts {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Int;
    e: Bool;
    f: Bool;
    g: Int;
}

contract ManyBoolsInts {
    val: BoolsInts;

    init() {
        self.val = BoolsInts{
            a:true,b:false,c:true,d:42,e:false,f:true,g:7
        };
    }
}