struct Inner {
    score: Int as uint32;
    flag: Bool?;
}

struct Outer {
    inner: Inner;
    label: String;
}

contract NestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{score: 77, flag: null},
            label: "test"
        };
    }
}