struct SameNameInner {
    foo: Int;
}

struct SameNameOuter {
    foo: Int;
    nested: SameNameInner;
}

contract SameNameContract {
    data: SameNameOuter;

    init() {
        self.data = SameNameOuter{
            foo: 1,
            nested: SameNameInner{
                foo: 2
            }
        };
    }
}