struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String?;
}

contract Test {
    data: Outer = Outer{
        x: 1,
        y: Inner{ a: 5, b: null },
        z: null
    };

    receive() {
        let _ = self.data.x + 1;
    }
}