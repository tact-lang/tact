struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    y: Inner?;
    z: String;
}

contract ComboNestOpt {
    data: Outer;

    init() {
        self.data = Outer{
            x: 7,
            y: Inner{
                a: 1,
                b: null
            },
            z: "yo"
        };
    }
}