struct InnerMost {
    a: Int;
    b: String?;
}

struct Nested2 {
    im: InnerMost;
    z: Bool;
}

struct Nested1 {
    mid: Nested2;
    q: Bool?;
}

contract Deeep {
    prop: Nested1;

    init() {
        self.prop = Nested1{
            mid: Nested2{
                im: InnerMost{
                    a: 5,
                    b: null
                },
                z: false
            },
            q: null
        };
    }
}
