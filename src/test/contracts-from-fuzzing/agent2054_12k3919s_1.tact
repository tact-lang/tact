struct OptionalFieldStruct { x: Int; y: Bool?; }

contract OptionalStructField {
    data: OptionalFieldStruct = OptionalFieldStruct{ x: 1, y: null };
}