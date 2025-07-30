struct Many {
    a: Int;  b: Bool;
    c: Int;  d: Bool;
    e: Int;  f: Bool;
    g: Int;  h: Bool;
}
contract ManyAlternatingFields {
    m: Many;

    init() {
        self.m = Many{
            a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false
        };
    }
}
