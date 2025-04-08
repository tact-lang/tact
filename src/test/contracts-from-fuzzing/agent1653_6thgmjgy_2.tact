struct Nested {
    n: Int?;
    flag: Bool;
}

struct Outer {
    inner: Nested;
    txt: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Nested{n: null, flag: false},
            txt: "hello"
        };
    }
}