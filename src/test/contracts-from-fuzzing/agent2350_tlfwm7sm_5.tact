struct Mid1 { a: Int; b: String?; }

struct Mid2 { c: Bool?; d: String; }

struct Top { m1: Mid1; m2: Mid2; e: Bool; f: Int?; }

contract MultiStructMixed {
    content: Top;

    init() {
        self.content = Top{
            m1: Mid1{
                a: 10,
                b: null
            },
            m2: Mid2 {
                c: null,
                d: "abc"
            },
            e: true,
            f: null
        };
    }
}