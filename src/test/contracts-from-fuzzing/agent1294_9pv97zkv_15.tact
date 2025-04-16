struct WideOpt {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Cell?;
  l: Slice?;
  m: Int?;
  n: Bool?;
  o: String?;
  p: Address?;
}

contract WideOptionalFields {
  stuff: WideOpt = WideOpt{
    a:null,b:true,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,k:null,l:null,m:null,n:null,o:null,p:null
  };
  receive() {}
}