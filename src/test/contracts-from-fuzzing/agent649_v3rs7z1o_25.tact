struct BigOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionals {
    st: BigOpt;

    init() {
        self.st = BigOpt{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}