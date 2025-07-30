struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    field: ManyOptional;

    init() {
        self.field = ManyOptional{ a:null, b:true, c:42, d:null, e:7, f:false };
    }
}