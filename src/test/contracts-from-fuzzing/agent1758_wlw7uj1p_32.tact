struct Outer {
    a: Int?;
    b: String?;
    c: Inner;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract StorageTest {
    val: Outer;

    init() {
        self.val = Outer{
            a: null,
            b: null,
            c: Inner{
                x: null,
                y: null
            }
        };
    }
}