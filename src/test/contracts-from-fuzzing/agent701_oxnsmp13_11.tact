struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalFlood {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:null, b:true, c:null, d:4, e:null, f:"hi"
        };
    }
}