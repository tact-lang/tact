struct InnerNested {
    id: Int;
    active: Bool;
    note: String;
}

struct WrapMany {
    x: InnerNested;
    y: InnerNested;
    z: InnerNested;
}

contract TripleNested {
    val: WrapMany;
    init() {
        self.val = WrapMany{
            x: InnerNested{ id:1, active:true, note:"a" },
            y: InnerNested{ id:2, active:false, note:"b" },
            z: InnerNested{ id:3, active:true, note:"c" },
        };
    }
}