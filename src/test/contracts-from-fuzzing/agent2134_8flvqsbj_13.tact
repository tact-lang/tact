struct NestedPrimitives {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    stringVal: String;
}

contract MixPrimitivePersistent {
    val: NestedPrimitives;

    init() {
        self.val = NestedPrimitives{
            intVal: -100,
            boolVal: true,
            sliceVal: emptyCell().asSlice(),
            stringVal: "abc"
        };
    }
}