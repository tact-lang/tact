struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
}

contract TestManyOptional {
    m: MultiOptional;
    init() {
        self.m = MultiOptional{
            a:null,b:"abc",c:null,d:5,e:null
        };
    }
}
