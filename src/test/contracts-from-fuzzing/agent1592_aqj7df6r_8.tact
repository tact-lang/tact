struct A { x: B; }
struct B { y: C; }
struct C { z: D; }
struct D { q: E; }
struct E { w: Int; opt: Int?; }

contract DeeplyNestedStruct {
    data: A;

    init() {
        self.data = A{
            x: B{
                y: C{
                    z: D{
                        q: E{ w: 123, opt: null }
                    }
                }
            }
        };
    }
}