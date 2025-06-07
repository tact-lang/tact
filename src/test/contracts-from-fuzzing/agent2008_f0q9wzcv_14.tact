struct LargeOptionalDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = false;
    e: Address?;
    f: Address? = null;
    g: String?;
    h: String? = null;
}

contract ManyOptionalDefaults {
    data: LargeOptionalDefaults;

    init() {
        self.data = LargeOptionalDefaults{
            a:null, c:null, e:null, g:null
        };
    }
}
