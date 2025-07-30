struct Inner {
    x: Int;
    y: Bool;
    z: Address?;
}

struct Middle {
    inner: Inner;
    s: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract NestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    x: 1,
                    y: false,
                    z: null,
                },
                s: "hello",
            },
            flag: true,
        };
    }
}