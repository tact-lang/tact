struct SWithMany {
  a: Int;
  b: Int;
  c: Bool;
  d: String;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int;
  k: Bool;
  l: String;
  m: Int;
  n: String;
  o: Bool;
  p: Int;
  q: String;
  r: Bool;
  s: Int;
  t: String;
}
contract ManyFields {
  data: SWithMany;
  init() {
    self.data = SWithMany{
      a:1,b:2,c:true,d:"d",e:false,f:"f",g:3,h:true,i:"i",j:4,
      k:false,l:"l",m:5,n:"n",o:true,p:6,q:"q",r:false,s:7,t:"t"
    };
  }
}