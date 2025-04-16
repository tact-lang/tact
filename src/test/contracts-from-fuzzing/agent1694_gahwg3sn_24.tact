struct A { x: Int }
struct B { y: A? }

contract NestedOptionalStruct {
    val: B;

    init() {
        self.val = B{ y: null };
    }
}