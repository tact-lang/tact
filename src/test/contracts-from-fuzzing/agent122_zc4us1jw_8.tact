struct Inner {
    x: Int; y: Int?; b: Bool; s: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    flag: Bool;
    message: String;
}

contract DeepFields {
    data: Outer;

    init() {
        self.data = Outer{
            one: Inner{ x:1, y:2, b:true, s:"a" },
            two: Inner{ x:3, y:null, b:false, s:"b" },
            flag: true,
            message: "done"
        };
    }
}
