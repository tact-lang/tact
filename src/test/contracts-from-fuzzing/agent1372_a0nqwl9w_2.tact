struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Middle {
    nest: Nested;
    ok: Bool;
}

contract TestContract {
    mid: Middle;
    
    init() {
        self.mid = Middle{
            nest: Nested{
                x: 4,
                y: false,
                z: "hi",
            },
            ok: true,
        };
    }
}