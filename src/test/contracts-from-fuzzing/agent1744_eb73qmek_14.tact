// test struct with a many bool fields (stress bit packing)
struct ManyBools {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
  i: Bool;
  j: Bool;
  k: Bool;
  l: Bool;
  m: Bool;
  n: Bool;
  o: Bool;
  p: Bool;
}

contract BoolPacked {
  bools: ManyBools;

  init() {
    self.bools = ManyBools{
      a:true,b:true,c:true,d:false,e:false,f:false,g:true,h:true,
      i:true,j:false,k:true,l:false,m:true,n:false,o:true,p:false
    };
  }
}
