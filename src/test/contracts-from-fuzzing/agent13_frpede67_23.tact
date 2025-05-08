// test many-layer nested optional structs inside params
struct S1 { a: Int; }
struct S2 { b: S1?; }
struct S3 { c: S2?; }
struct S4 { d: S3?; }

contract TestContract(
    field: S4?
) {}