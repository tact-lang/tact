struct DeeplyNested {
    level1: A;
}

struct A { x: Int; y: B; }
struct B { p: Int; q: C; }
struct C { foo: Bool; bar: D; }
struct D { s: String; t: E; }
struct E { last: Int; }

contract Nested {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested {
            level1: A {
                x:1, y:B{
                    p:2, q:C{
                        foo:true, bar:D{
                            s:"end", t:E{last: 42}
                        }
                    }
                }
            }
        };
    }
}