struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a:null, b:true, c:null, d:myAddress(),
            e:5, f:null, g:"abc", h:null
        };
    }
}