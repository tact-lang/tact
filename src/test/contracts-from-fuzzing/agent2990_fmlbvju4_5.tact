struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Int?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null, h: null, i: null, j: null
        };
    }
}