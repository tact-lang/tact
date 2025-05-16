struct Nested { a: Int; b: Bool; c: Int?; }

contract TopStruct {
    val: Nested = Nested{ a: 42, b: true, c: null };
    init() {}
}