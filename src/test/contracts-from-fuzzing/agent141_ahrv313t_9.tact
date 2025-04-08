struct MixedTypes {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    data: Cell;
    sl: Slice;
    bld: Builder;
    strOpt: String?;
}

contract MixedFieldStruct {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            x:1,
            y:true,
            z: myAddress(),
            s:"hello",
            data: emptyCell(),
            sl: emptyCell().asSlice(),
            bld: beginCell(),
            strOpt: null
        };
    }
}