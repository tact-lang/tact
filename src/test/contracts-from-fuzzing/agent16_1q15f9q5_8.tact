struct A { b: Int }
struct B { c: A }
struct C { d: B }

contract MapOfStructs {
    storage: map<Int, C>;

    init() {
        self.storage = emptyMap();
    }
}
