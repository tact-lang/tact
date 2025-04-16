// deep nested optional chain with some init
struct A { val: Int }
struct B { a: A? }
struct C { b: B? }
struct D { c: C? }

contract InitMidChain {
    root: D;

    init() {
        self.root = D{
            c: C{
                b: null
            }
        };
    }
}
