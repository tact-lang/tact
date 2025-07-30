struct BigNested {
    a: Int;
    b: Nested1;
    c: Nested2;
}

struct Nested1 {
    d: Int;
    e: Inner1;
}

struct Inner1 {
    f: Int;
}

struct Nested2 {
    g: Int;
    h: Inner2;
}

struct Inner2 {
    i: Int;
}

contract Combo {
    val: BigNested;

    init() {
        self.val = BigNested{
            a: 1,
            b: Nested1{
                d: 2,
                e: Inner1{
                    f: 3
                }
            },
            c: Nested2{
                g: 4,
                h: Inner2{
                    i: 5
                }
            }
        };
    }
}