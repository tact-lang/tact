struct A { x: Int; }
struct Container { inner: A?; }

contract NestedOptStruct {
    c: Container?;

    init() {
        self.c = Container{ inner: null };
    }
}