struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionalFields {
    foo: ManyOptionals;

    init() {
        self.foo = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}