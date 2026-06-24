struct OptionalStructs {
    a: Inner?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract OptionalStructsHolder {
    s: OptionalStructs;

    init() {
        self.s = OptionalStructs{
            a:null,
            b:Inner{
                x:1,
                y:null,
            }
        };
    }
}