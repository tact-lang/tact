struct HasSlice {
 sl: Slice;
}

struct OuterSliceNest {
 inner: HasSlice?;
}

contract OptionalSliceNestTest {
    nested: OuterSliceNest;

    init() {
        self.nested = OuterSliceNest{ inner: null };
    }
}