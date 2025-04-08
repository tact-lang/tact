struct NestedSlices {
    s1: Slice;
    s2: Slice;
}

struct Container {
    nested1: NestedSlices;
    nested2: NestedSlices;
}

contract TestContract {
    data: Container;

    init() {
        let sl = emptyCell().asSlice();
        self.data = Container{
            nested1: NestedSlices{ s1: sl, s2: sl },
            nested2: NestedSlices{ s1: sl, s2: sl }
        };
    }
}