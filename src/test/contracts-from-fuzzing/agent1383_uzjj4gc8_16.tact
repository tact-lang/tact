struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
}

contract ManyOptionals {
    m: MultiOption;

    init() {
        self.m = MultiOption{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}