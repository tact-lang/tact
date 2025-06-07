// Very deep chain of nested optionals involving default and optional fields interleaved
struct A { b: B?; }
struct B { c: C; }
struct C { d: D?; }
struct D { e: E; }
struct E { f: F?; }
struct F { v: Int = 1; }

contract SuperDeep {
    root: A;
    init() {
        self.root = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{}
                        }
                    }
                }
            }
        };
    }
}
