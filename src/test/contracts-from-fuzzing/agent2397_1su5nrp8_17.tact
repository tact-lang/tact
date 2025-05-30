struct S1 { a: Int; b: Bool; }
struct S2 { c: S1; d: S1; }
struct S3 { e: S2; f: S2; }

contract CrossNested {
  data: S3 = S3{
    e: S2{ c: S1{a:1,b:true}, d:S1{a:2,b:false} },
    f: S2{ c: S1{a:3,b:true}, d:S1{a:4,b:false} }
  };
  receive() {}
}