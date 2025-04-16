struct OptDefaults2 {
    a: String = "d";
    b: Int = 123;
    c: Bool = false;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsOptTest {
    s: OptDefaults2;
    init() {
        self.s = OptDefaults2{
            d:null, e:null, f:null
        };
    }
}