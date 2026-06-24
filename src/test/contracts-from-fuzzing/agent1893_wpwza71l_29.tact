struct NestedStruct1 {
    a: Int;
}
struct NestedStruct2 {
    b: NestedStruct1;
}
struct NestedStruct3 {
    c: NestedStruct2;
}
struct NestedStruct4 {
    d: NestedStruct3;
}
struct NestedStruct5 {
    e: NestedStruct4;
}

contract NullableDeep {
    val: NestedStruct5?;

    init() {
        self.val = null;
    }
}