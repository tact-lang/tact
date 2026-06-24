struct C { val: Int? = null; }
struct B { sC: C? = null; }
struct A { sB: B? = null; }

contract DeepOptionalStructs {
    nested: A = A{ sB: null };

    init() {
        self.nested = A{
            sB: B{
                sC: C{ val: 99 }
            }
        };
    }

    receive() {}
}