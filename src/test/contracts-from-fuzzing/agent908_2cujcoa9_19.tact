struct ComplexOptionals {
    partA: Slice?;
    partB: Cell?;
    text: String;
}

contract SliceCellOptional {
    val: ComplexOptionals;

    init() {
        self.val = ComplexOptionals{
            partA: null,
            partB: null,
            text: "data"
        };
    }
}