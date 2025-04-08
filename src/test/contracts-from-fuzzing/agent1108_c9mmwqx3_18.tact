struct Bar {
    id: Int?;
    active: Bool;
}

struct Baz {
    title: String?;
    score: Int;
}

contract TestContract(
    num: Int?,
    bar: Bar?,
    baz: Baz
) {}