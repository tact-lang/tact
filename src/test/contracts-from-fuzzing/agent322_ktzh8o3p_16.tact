struct S1 {
  a:Int; b:Int; c:Int; d:Int; e:Int;
}
struct S2 {
  f:Int; g:Int; h:Int; i:Int; j:Int;
}
struct S3 {
  k:Int; l:Int; m:Int; n:Int; o:Int;
}
struct Combo {
  s1:S1;
  s2:S2;
  s3:S3;
}

contract NestedWide {
  val: Combo = Combo{
    s1:S1{a:1,b:2,c:3,d:4,e:5},
    s2:S2{f:6,g:7,h:8,i:9,j:10},
    s3:S3{k:11,l:12,m:13,n:14,o:15}
  };
}