struct InnerOptional {
    a: Int?;
    b: Bool?;
}

contract StructWithOptionals {
    field: InnerOptional = InnerOptional{ a: null, b: null };
}