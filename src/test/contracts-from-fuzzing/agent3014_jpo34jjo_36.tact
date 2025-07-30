// Contract with single optional complex nested struct
struct DeepStruct {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract OptionalDeepStruct {
    val: DeepStruct?;
    init() {
        self.val = null;
    }
}