// Struct with a huge amount of mixed optional and required fields
struct Many {
  a: Int=1; b:Int?; c:Int=3; d:Int?; e:Int=5;
  f:Int?; g:Int=7; h:Int?; i:Int=9; j:Int?;
  k:Int=11; l:Int?; m:Int=13; n:Int?; o:Int=15;
}
contract Test {
  m: Many;
  init() {
    self.m = Many{
      b:null, d:null, f:null, h:null, j:null, l:null, n:null,
      a:1, c:3, e:5, g:7, i:9, k:11, m:13, o:15
    };
  }
}