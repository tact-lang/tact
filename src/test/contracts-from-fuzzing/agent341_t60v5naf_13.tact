struct HasDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "hello";
    d: Int?; // implicitly null
    e: Bool?; // implicitly null
    f: String?; // implicitly null
}

contract DefaultsContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            a:100,
            b:false,
            c:"world",
            d:1,
            e:true,
            f:null
        };
    }
}