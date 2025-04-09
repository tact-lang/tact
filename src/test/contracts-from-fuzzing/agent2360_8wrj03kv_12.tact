// Contract with nested optional struct fields that use defaulted inner fields
struct Inner {
    a: Int = 0;
    b: Bool = true;
}

struct Outer {
    i: Inner?;
}

contract NestedOptionals {
    val: Outer;
    init() {
        self.val = Outer{ i: null };
    }
}