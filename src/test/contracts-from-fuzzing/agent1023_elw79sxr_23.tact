struct StructWithSliceOptional {
    x: Int;
    y: Slice?;
}

contract SliceOptionalContract {
    a: StructWithSliceOptional;

    init() {
        self.a = StructWithSliceOptional{ x: 5, y: null };
    }
}