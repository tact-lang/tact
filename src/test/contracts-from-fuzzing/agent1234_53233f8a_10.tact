struct SDeep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Nested1 { s: SDeep; }
struct Nested2 { ns: Nested1; }
struct Nested3 { n2: Nested2; }
struct Nested4 { n3: Nested3; }
struct Nested5 { n4: Nested4; }

contract FiveLayersNested {
    deep: Nested5;

    init() {
        self.deep = Nested5{
            n4: Nested4{
                n3: Nested3{
                    n2: Nested2{
                        ns: Nested1{
                            s: SDeep{a:1,b:2,c:3,d:4,e:5}
                        }
                    }
                }
            }
        };
    }
}