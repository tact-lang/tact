struct MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
}

contract MixedOptTest {
    data: MixedOptionals;
    init() {
        self.data = MixedOptionals{
            a:null,
            b:true,
            c:null,
            d:null,
            e:5
        };
    }
}