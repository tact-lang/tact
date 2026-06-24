struct Complex {
  intVal: Int;
  boolVal: Bool;
  addressVal: Address;
  stringVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract TestContract {
    data: Complex;
    init() {
        self.data = Complex{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            stringVal: "abc",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            optInt: null,
            optBool: null,
            optString: null,
        };
    }
}