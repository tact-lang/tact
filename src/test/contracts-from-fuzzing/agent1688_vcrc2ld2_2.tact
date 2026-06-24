struct Inner {
    flag: Bool;
    text: String;
}

struct Outer {
    inner: Inner;
    number: Int;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{
                flag: false,
                text: "text"
            },
            number: 42
        };
    }
}