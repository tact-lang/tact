// Test struct nesting map of optional Structs with optional outer

struct Inner {
    id: Int;
}

struct Wrapper {
    entries: map<Int, Inner>;
}

struct OuterWrap {
    wrap: Wrapper?;
}

contract TestContract {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{ wrap: null };
    }
}