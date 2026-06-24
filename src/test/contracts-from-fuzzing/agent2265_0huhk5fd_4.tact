struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Inner {
    a: InnerMost?;
    b: Int;
}

struct Container {
    inner: Inner;
    flag: Bool?;
}

contract MixedComplex {
    record: Container?;
    
    init() {
        self.record = Container{
            inner: Inner{
                a: null,
                b: 123,
            },
            flag: true,
        };
    }
}