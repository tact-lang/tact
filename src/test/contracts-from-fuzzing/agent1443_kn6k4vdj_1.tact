struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            a: 5,
            b: Inner{
                x: 10,
                y: false
            },
            c: "abc"
        };
    }

    receive() {}
}