struct CrazyNested {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    x: Int;
    y: Nested2;
}

struct Nested2 {
    z: Int;
    w: Nested3;
}

struct Nested3 {
    q: Int;
    r: Nested4;
}

struct Nested4 {
    s: Int;
    t: Bool;
}

contract CrazyNestedContract {
    data: CrazyNested;

    init() {
        self.data = CrazyNested{
            a: 1,
            b: Nested1{
                x: 2,
                y: Nested2{
                    z: 3,
                    w: Nested3{
                        q: 4,
                        r: Nested4{
                            s: 5,
                            t: true
                        }
                    }
                }
            }
        };
    }
}