struct Inner {
    x: Int? = null;
    s: String? = null;
}

struct Outer {
    text: String;
    inn: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            text: "abc",
            inn: Inner{}
        };
    }
}