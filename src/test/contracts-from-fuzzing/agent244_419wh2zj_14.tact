// Contract with nested structs containing all primitive types
struct Prim {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    strVal: String;
}

struct Container {
    prim: Prim;
    flag: Bool;
}

contract PrimitiveNested {
    data: Container;

    init() {
        self.data = Container{
            prim: Prim{
                intVal: 1,
                boolVal: true,
                addrVal: myAddress(),
                cellVal: emptyCell(),
                sliceVal: emptyCell().asSlice(),
                builderVal: beginCell(),
                strVal: "s",
            },
            flag: false,
        };
    }
}