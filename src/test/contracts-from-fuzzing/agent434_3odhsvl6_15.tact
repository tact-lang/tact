struct A { x: Int?; }
struct B { y: A?; }
struct C { z: B?; }

contract DeepNestedOpt {
    top: C;

    init() {
        self.top = C{
            z: B{
                y: A{
                    x: null
                }
            }
        };
    }

    receive() {}
}
