struct WithManyOptionals {
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
    f: WithManyOptionals;

    init() {
        self.f = WithManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
