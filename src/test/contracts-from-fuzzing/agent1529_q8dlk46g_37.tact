// test optional in deeply nested structs
struct A { x: Int; }
struct B { ax: A?; }
struct C { bx: B?; }
struct D { cx: C?; }
struct E { dx: D?; }

contract OptionalsNested5 {
    val: E;

    init() {
        self.val = E{ dx: null };
    }
}
