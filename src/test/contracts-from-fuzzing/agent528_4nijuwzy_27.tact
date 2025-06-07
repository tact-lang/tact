struct S1 { a: Int?; b: Bool; c: String; }
struct S2 { s: S1; d: Bool?; e: String?; }
struct S3 { s: S2; f: Int; g: Bool?; }
struct S4 { s: S3; h: String; i: Int?; }
struct S5 { s: S4; j: Bool; k: String?; }
struct S6 { s: S5; l: Int; m: Bool?; }

contract DeepChainTop(
    val: S6,
) {}
