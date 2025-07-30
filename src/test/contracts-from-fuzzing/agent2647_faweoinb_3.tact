struct Inner {
    f1: Bool;
    f2: Int?;
    f3: String;
}

struct Outer {
    f1: Inner;
    f2: Inner?;
    f3: String;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            f1: Inner{f1: true, f2: 10, f3: "abc"},
            f2: null,
            f3: "hello"
        };
    }
}