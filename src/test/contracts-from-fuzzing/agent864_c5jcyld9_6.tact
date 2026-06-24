struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    x: Int;
    y: Inner1;
    z: String;
}

struct Inner3 {
    m: Inner2;
    n: Bool;
}

contract TestContract {
    nested: Inner3;

    init() {
        self.nested = Inner3{
            m: Inner2{
                x: 1,
                y: Inner1{
                    a: 2,
                    b: true
                },
                z: "hi"
            },
            n: false
        };
    }
}