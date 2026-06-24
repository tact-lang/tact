struct Inner {
    f: Int;
}

struct Outer {
    in: Inner;
    x: Int;
}

contract TestContract {
    receive() {
        let o: Outer = Outer{
            in: Inner{ f: 42 },
            x: 10
        };
        dump(o.in.f);
    }
}
