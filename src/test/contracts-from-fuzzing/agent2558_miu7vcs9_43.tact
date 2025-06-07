struct DeepInit {
    i: Int;
    s: String;
    b: Bool;
    io: Int?;
    so: String?;
    bo: Bool?;
}

contract DeepInitContract {
    f: DeepInit;

    init() {
        self.f = DeepInit{
            i:123,
            s:"sss",
            b:true,
            io:null,
            so:null,
            bo:false,
        };
    }
}