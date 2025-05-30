struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a:1,
            b:true,
            c:null,
            d:false,
            e:5,
            f:null,
            g:7,
            h:true,
        };
    }
}