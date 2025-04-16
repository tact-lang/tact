struct SubA { i: Int; }
struct SubB { j: Bool; }

contract ParamsWithNested(
    a: SubA,
    b: SubB,
    c: SubA?,
    d: Int?
) {
    // contract params with nested structs, optional nested structs, and optional primal
}