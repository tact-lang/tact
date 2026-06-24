struct MultiNullable {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract MultiNullVars {
    data: MultiNullable = MultiNullable{ a: null, b: null, s: null };
}