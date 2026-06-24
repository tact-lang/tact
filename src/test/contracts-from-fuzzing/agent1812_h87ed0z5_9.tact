struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: String?;
}

contract ManyOptionalsContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null, h: null
        };
    }
}