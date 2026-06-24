struct HasManyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Address?;
}

contract ManyOptionals {
    data: HasManyOpt;

    init() {
        self.data = HasManyOpt{a:null, b:null, c:null, d:null, e:null};
    }
}