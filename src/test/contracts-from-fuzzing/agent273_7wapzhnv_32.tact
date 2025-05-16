struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { s1: S1; s2: S2; c: String; }

struct BigWrap {
  f1: S3;
  f2: S3;
  f3: S3;
  f4: S3;
  f5: S3;
}

contract TestContract {
  data: BigWrap;

  init() {
    self.data = BigWrap{
      f1: S3{ s1:S1{a:1}, s2:S2{b:true}, c:"a" },
      f2: S3{ s1:S1{a:2}, s2:S2{b:false}, c:"b" },
      f3: S3{ s1:S1{a:3}, s2:S2{b:true}, c:"c" },
      f4: S3{ s1:S1{a:4}, s2:S2{b:false}, c:"d" },
      f5: S3{ s1:S1{a:5}, s2:S2{b:true}, c:"e" }
    };
  }
}