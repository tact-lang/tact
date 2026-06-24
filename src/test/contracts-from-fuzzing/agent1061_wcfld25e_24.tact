// Defensive case: optional contract persistent field with nested struct
struct SomeStruct {
  v1: Int;
  v2: Bool;
}

contract Test {
    field: SomeStruct?;

    init() {
        self.field = null;
    }
}