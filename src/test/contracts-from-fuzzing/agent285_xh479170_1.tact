struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
    text: String;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                count: 5,
                text: "hello"
            }
        };
    }
}
