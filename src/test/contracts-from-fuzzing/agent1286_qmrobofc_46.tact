struct InnerMany {
  a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;
}

contract NestedStructInParam(
    x: InnerMany
) {}