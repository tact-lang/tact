struct Depth4 {
    a: Int;
    b: Depth3;
}
struct Depth3 {
    c: Bool;
    d: Depth2;
}
struct Depth2 {
    e: String;
    f: Depth1?;
}
struct Depth1 {
    g: Int?;
    h: Bool;
}

contract Deep4Structs {
    store: Depth4;

    init() {
        self.store = Depth4{
            a:1,
            b:Depth3{
                c:true,
                d:Depth2{
                    e:"hello",
                    f:Depth1{
                        g:5,
                        h:false
                    }
                }
            }
        };
    }
}