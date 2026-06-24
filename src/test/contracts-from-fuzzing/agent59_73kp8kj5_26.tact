contract NestedOptionals {
    inner1: Int? = null;
    inner2: Int? = null;
    inner3: Int? = null;

    structInner: StructWithNullable? = null;
}

struct StructWithNullable {
    x: Int?;
    y: Bool?;
}
