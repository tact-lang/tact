struct Inner {
    val: Int?;
    flag: Bool?;
    text: String?;
}

struct Outer {
    inner: Inner?;
    count: Int;
    status: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{
                val: null,
                flag: false,
                text: null
            },
            count: 42,
            status: true
        };
    }
}