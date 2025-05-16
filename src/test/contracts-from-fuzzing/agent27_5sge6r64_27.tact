// optional struct default to null, nested inside persistent
struct Inner {
    a: Int;
}

contract TestContract {
    o: Inner?;
    init() {
        self.o = null;
    }
}
