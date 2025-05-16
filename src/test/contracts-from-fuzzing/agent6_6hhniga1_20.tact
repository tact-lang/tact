// Edge case: Optional containing struct with remaining
struct Container {
    sub: SubStruct?;
}

struct SubStruct {
    v: Int;
    rem: Slice as remaining;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            sub: null
        };
    }
}
