struct HasManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Bool?;
    h: Bool?;
    i: String?;
}

contract ManyOptionalsDeep {
    s: HasManyOptionals;
    x: Int?;
    y: String?;
    z: Bool?;

    init() {
        self.s = HasManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
        };
        self.x = null;
        self.y = null;
        self.z = null;
    }
}