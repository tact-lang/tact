struct NestedStruct {
 x: Int;
 y: Int?;
}

contract TestContract {
 nestedField: NestedStruct;

 init() {
 self.nestedField = NestedStruct{ x: 5, y: null };
 }
}