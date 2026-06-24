struct Large {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract BigFields {
    payload: Large;
    init() {
        self.payload = Large{
            a:1,b:1,c:1,d:1,e:1,f:1,g:1,h:1,i:1,j:1
        };
    }
}