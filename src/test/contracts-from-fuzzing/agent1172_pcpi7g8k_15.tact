struct WrappedPrimitives {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
}

contract StructFieldTest {
  wrapper: WrappedPrimitives;

  init() {
    self.wrapper = WrappedPrimitives{
      intVal: 1,
      boolVal: false,
      strVal: "ok",
      cellVal: emptyCell(),
      sliceVal: beginCell().endCell().asSlice(),
      builderVal: beginCell()
    };
  }
}