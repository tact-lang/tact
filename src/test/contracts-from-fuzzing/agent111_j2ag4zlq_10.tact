struct Inner {
    a: Int;
    b: Bool?;
}
struct Middle {
    a: Inner;
    b: Int?;
}
struct Outer {
    a: Middle;
    b: String;
}

contract MultiLayerFields {
    store: Outer;
    init() {
        self.store = Outer{
            a: Middle{
                a: Inner{a:0, b:null},
                b: null
            },
            b: ""
        };
    }
}