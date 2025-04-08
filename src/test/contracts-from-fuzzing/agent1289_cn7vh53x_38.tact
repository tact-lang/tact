// contract with deeply nested struct wrapping optional struct wrapping optional struct
struct DeepStruct { v: Int; }
struct MiddleStruct { d: DeepStruct?; }
struct OuterStruct { m: MiddleStruct?; }

contract DeepNestedOptional {
    val: OuterStruct?;

    init() {
        self.val = null;
    }
}
