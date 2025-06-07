struct OptionNest {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    strVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;
}

struct OptionHolder {
    o1: OptionNest?;
    o2: OptionNest?;
    text: String;
}

contract NestedOpts {
    h1: OptionHolder;

    init() {
        self.h1 = OptionHolder{
            o1: null,
            o2: null,
            text: "abc"
        };
    }
}
