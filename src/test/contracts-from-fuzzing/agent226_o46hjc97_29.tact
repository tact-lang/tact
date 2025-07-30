struct SliceCellOptional {
    s: Slice?;
    c: Cell?;
}

contract TestSliceCellOptional {
    data: SliceCellOptional;

    init() {
        self.data = SliceCellOptional{ s:null,c:null };
    }
}
