struct S { a: Int }

contract DefaultField {
    f: S = S{ a: 123 };
    init() {}
}