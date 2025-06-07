// deep nested field optional, complex interplay
struct A { x: Int }
struct B { a: A? }
struct C { b: B? }
struct D { c: C? }

contract DeepOpt {
    val: D;

    init() {
        self.val = D{ c: null };
    }
}
