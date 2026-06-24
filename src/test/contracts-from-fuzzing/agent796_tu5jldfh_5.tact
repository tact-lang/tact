// Contract with optional nested struct

struct Inner {
    a: Int?;
    b: String;
}

struct Outer {
    m: Inner?;
    z: Int;
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            m: null,
            z: 7
        };
    }
}