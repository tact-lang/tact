struct Inner {
    v1: Int;
    v2: Bool?;
    v3: String;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    description: String?;
}

contract DeepNest {
    data: Outer;
    
    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    v1: 5,
                    v2: true,
                    v3: "test",
                },
                flag: false,
            },
            description: null,
        };
    }
}