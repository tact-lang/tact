struct NestedPrimitives {
  p1: PrimitiveTypes;
  p2: PrimitiveTypes;
}

struct PrimitiveTypes {
  intVal: Int;
  boolVal: Bool;
  addressVal: Address;
  sliceVal: Slice;
  cellVal: Cell;
  stringVal: String;
}

contract NestedPrimitiveFields {
  n: NestedPrimitives;

  init() {
    self.n = NestedPrimitives{
      p1: PrimitiveTypes{
        intVal: 1,
        boolVal: true,
        addressVal: myAddress(),
        sliceVal: emptySlice(),
        cellVal: emptyCell(),
        stringVal: "one",
      },
      p2: PrimitiveTypes{
        intVal: 2,
        boolVal: false,
        addressVal: myAddress(),
        sliceVal: emptySlice(),
        cellVal: emptyCell(),
        stringVal: "two",
      },
    };
  }
}