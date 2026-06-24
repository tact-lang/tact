struct Meta {
    details: String?;
}

message(66) Complex {
    tag: Int?;
    meta: Meta?;
}

contract DeepNestedParam(
    c: Complex?
) {}