struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
}

contract TestContract {
    data: ManyOptionals = ManyOptionals{
        a:null, b:null, c:null, d:null, e:null, f:null
    };

    init() {
        self.data = ManyOptionals{
            a:1, b:2, c:3, d:true, e:false, f:true
        };
    }
}