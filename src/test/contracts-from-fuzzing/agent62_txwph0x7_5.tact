struct A { xs: map<Int, Int> }
struct B { a: A; xs: map<Int, Int> }

contract TestContract {
    nestedMapStruct: B;

    init() {
        self.nestedMapStruct = B{ a: A{ xs: emptyMap() }, xs: emptyMap() };
    }
}