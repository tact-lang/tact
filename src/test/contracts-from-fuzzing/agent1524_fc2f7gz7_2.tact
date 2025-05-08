struct InnerMost {
    x: Int;
    y: String;
}

struct Inner {
    a: InnerMost;
    b: Bool?;
}

struct Wrapper {
    inner: Inner;
    flag: Bool;
}

contract DeepNestedTest {
    data: Wrapper;
    
    init() {
        self.data = Wrapper{
            inner: Inner{
                a: InnerMost{ x: 5, y: "hi" },
                b: null
            },
            flag: true
        };
    }
}