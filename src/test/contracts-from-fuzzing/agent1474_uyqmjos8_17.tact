struct Inner1 { x: Int; }
struct Inner2 { inner1: Inner1; y: Bool; }
struct Inner3 { inner2: Inner2; z: String; }

struct Wrap {
    nested: Inner3;
    flag: Bool?;
}

contract Test16 {
    w: Wrap;
    init() {
        self.w = Wrap{
            nested: Inner3{
                inner2: Inner2{
                    inner1: Inner1{ x: 123 },
                    y: true
                },
                z: "zzz"
            },
            flag: null
        };
    }
}