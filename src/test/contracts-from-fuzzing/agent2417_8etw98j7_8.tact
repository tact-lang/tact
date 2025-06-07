struct ManyOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOptional {
    data: ManyOpt;

    init() {
        self.data = ManyOpt{
            a:1, b:null, c:3, d:null, e:5
        };
    }
}
