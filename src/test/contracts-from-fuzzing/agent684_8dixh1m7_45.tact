// Optional contract field of contract struct type
struct SampleStruct { x: Int; y: Int?; }

contract OptionalStructField {
    s: SampleStruct?;
    init() {
        self.s = null;
    }
}