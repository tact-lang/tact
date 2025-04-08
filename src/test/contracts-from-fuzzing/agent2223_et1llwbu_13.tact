struct S1 { a: Int }
struct S2 { a: S1 }
struct S3 { a: S2 }
struct S4 { a: S3 }
struct S5 { a: S4 }
struct S6 { a: S5 }
struct S7 { a: S6 }
struct S8 { a: S7 }

contract DeeplyNested8 {
    nested: S8 = S8{a:S7{a:S6{a:S5{a:S4{a:S3{a:S2{a:S1{a:777}}}}}}}};
}