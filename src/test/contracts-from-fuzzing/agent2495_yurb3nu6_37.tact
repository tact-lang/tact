struct OptionalsOverflow {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
}

contract ManyOptionalsOverflow {
    o: OptionalsOverflow;

    init() {
        self.o = OptionalsOverflow{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null
        };
    }
}