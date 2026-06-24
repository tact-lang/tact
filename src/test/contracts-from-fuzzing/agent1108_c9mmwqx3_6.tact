struct Inner {
    val: Int;
}

struct Outer {
    i: Inner;
    txt: String;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            i: Inner{ val: 17 },
            txt: "hello"
        };
    }
}