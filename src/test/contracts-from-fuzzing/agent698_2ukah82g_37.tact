struct Crazy {
    a: Int?;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: Int;
}

contract TestContract {
    data: Crazy;

    init() {
        self.data = Crazy{
            a:null,
            b:true,
            c:123,
            d:"hey",
            e:false,
            f:456
        };
    }
}