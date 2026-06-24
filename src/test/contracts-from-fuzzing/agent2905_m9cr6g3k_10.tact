struct A { val: Int; }

struct B { val: Int; opt: A?; }

struct C { val: Int; optB: B?; }

contract NestedOptionalFields {
    field: C;

    init() {
        self.field = C{
            val: 1,
            optB: null
        };
    }
}