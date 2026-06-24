// nested struct containing all primitive types and optionals
struct Primitives {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  addressVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
  optAddress: Address?;
  optCell: Cell?;
  optSlice: Slice?;
}

contract TestContract {
  data: Primitives;

  init() {
    self.data = Primitives{
      intVal: 1,
      boolVal: true,
      stringVal: "hi",
      addressVal: myAddress(),
      cellVal: emptyCell(),
      sliceVal: emptyCell().asSlice(),
      optInt: null,
      optBool: null,
      optString: null,
      optAddress: null,
      optCell: null,
      optSlice: null
    };
  }
}