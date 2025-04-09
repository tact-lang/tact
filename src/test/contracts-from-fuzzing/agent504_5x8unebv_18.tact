struct HasManyOptionalInts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptionalIntsCtr {
    vals: HasManyOptionalInts;

    init() {
        self.vals = HasManyOptionalInts{
            a: null,b:1,c:null,d:2,e:null
        };
    }

    receive() {
        let _ = self.vals;
    }
}