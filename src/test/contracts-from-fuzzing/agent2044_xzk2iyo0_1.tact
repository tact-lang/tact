struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    i: Inner;
    s: String;
    o: Inner?;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            i: Inner{a: 1, b: true},
            s: "hello",
            o: null,
        };
    }
}