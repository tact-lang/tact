struct NestedWithNulls {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefaultsNestedNulls {
    val: NestedWithNulls = NestedWithNulls{
        a: null,
        b: null,
        c: null,
    };
}