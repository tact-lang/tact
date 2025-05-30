struct Inner {
    m: map<Int, Int>;
    c: Int?;
}

struct Outer {
    a: Int;
    b: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: null
        };
    }

    receive() {
        let a = self.data.a;
    }
}