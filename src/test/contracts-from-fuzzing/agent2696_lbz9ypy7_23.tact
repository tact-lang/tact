struct Inner {
    x: Int;
    y: Int?;
    z: Bool;
}

struct Outer {
    s: Inner;
    t: String;
}

contract StructOfStruct {
    val: Outer?;

    init() {
        self.val = Outer{
            s: Inner{
                x: 1,
                y: null,
                z: true,
            },
            t: "abc",
        };
    }
}