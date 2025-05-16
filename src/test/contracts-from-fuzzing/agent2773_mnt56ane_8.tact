struct S1 { a: Int; b: Bool; }
struct S2 { c: Int; d: Bool; }
struct S3 { e: Int; f: Bool; }
struct S4 { g: Int; h: Bool; }

contract NestedStorage {
    x: S1 = S1{a: 1, b: false};
    y: S2 = S2{c: 5, d: true};
    z: S3 = S3{e: -3, f: true};
    w: S4 = S4{g: 42, h: false};
}