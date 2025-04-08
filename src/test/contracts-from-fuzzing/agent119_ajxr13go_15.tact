struct NestedContractFields {
  intField: Int;
  boolField: Bool;
  sliceField: Slice;
  cellField: Cell;

}

contract MultiTypeTest {
  composite: NestedContractFields;

  init() {
    self.composite = NestedContractFields{
      intField: 123,
      boolField: true,
      sliceField: emptyCell().asSlice(),
      cellField: emptyCell()
    };
  }
}