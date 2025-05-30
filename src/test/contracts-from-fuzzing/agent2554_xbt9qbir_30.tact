struct HasSliceBuilder {
    sl: Slice;
    bu: Builder;
    intVal: Int;
}

contract SliceBuilderUse {
    f: HasSliceBuilder;

    init() {
        self.f = HasSliceBuilder{
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            intVal: 77
        };
    }
}