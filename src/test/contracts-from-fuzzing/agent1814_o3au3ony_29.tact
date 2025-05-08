struct BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract ManyOptionals {
    s: BigOptional;

    init() {
        self.s = BigOptional{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
