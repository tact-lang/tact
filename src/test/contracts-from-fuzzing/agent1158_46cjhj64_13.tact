struct A { val: Int }
struct B { val: A? }
struct C { val: B? }

contract NestedOptionalChain {
    field: C;

    init() {
        self.field = C{
            val: B{
                val: null
            }
        };
    }
}
