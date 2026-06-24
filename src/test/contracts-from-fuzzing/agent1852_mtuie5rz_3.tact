struct Inner {
    z: Int;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    name: String;
}

struct Outer {
    mid: Middle;
    count: Int;
}

contract DeepNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{z: 7, flag: true},
                name: "deep"
            },
            count: 42
        };
    }
}