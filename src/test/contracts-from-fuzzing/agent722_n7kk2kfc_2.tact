struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    q: Int;
    nested: Inner;
    flag: Bool;
}

contract DeepStruct {
    data: Outer;

    init() {
        self.data = Outer{
            q: 5,
            nested: Inner{
                x: 10,
                y: null,
                z: "abc",
            },
            flag: true,
        };
    }
}