struct BigStruct {
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
    k: Int;
    l: Int;
}

contract ManyFields {
    big1: BigStruct;
    big2: BigStruct;

    init() {
        self.big1 = BigStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12
        };
        self.big2 = BigStruct{
            a:12,b:11,c:10,d:9,e:8,f:7,g:6,h:5,i:4,j:3,k:2,l:1
        };
    }
}