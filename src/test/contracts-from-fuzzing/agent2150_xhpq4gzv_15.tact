struct Middle {
    x: Int;
    y: Int?;
    z: Inner;
}

struct Inner {
    a: Bool;
    b: Bool?;
    c: String;
}

contract TestContract {
    val: Middle;

    init() {
        self.val = Middle{
            x: 5,
            y: null,
            z: Inner{
                a: true,
                b: null,
                c: "xyz"
            }
        };
    }
}