struct Deep {
    x: Int;
    y: Bool;
}

struct Mid {
    d: Deep;
    flag: Bool;
}

struct Top {
    m: Mid;
    z: Int;
}

contract MultiNestedContract {
    nested: Top = Top{
        m: Mid{
            d: Deep{x: 10, y: false},
            flag: true
        },
        z: 42
    };

    receive() {
        let _ = self.nested.m.d.x;
        let _ = self.nested.m.d.y;
        let _ = self.nested.m.flag;
        let _ = self.nested.z;
    }
}