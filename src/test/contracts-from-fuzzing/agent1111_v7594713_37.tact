// test deeply nested optional structs defaulted null
struct S1 { v:Int?=null; }
struct S2 { s:S1?=null; }
struct S3 { s:S2?=null; }
struct S4 { s:S3?=null; }
contract DeepOptDef {
 s:S4?=null;
 init() {}
}