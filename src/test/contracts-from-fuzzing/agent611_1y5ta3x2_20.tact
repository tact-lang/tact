struct A { x: Int=1; y: Bool=true; }
struct B { s: String="hi"; a: A=A{}; }
struct C { ad: Address?=null; b: B=B{}; }

contract NestedDefs {
    val: C;

    init() {
        self.val = C{};
    }
}