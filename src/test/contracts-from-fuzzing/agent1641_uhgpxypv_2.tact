struct Inner {
    n: Int;
    o: Bool?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool?;
}

contract TestContract {
    dat: Outer;

    init() {
        self.dat = Outer{
            x: 12,
            y: Inner{n: 5, o: true},
            z: null
        };
    }
}