struct Large {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Bool = true;
  e: String = "hi";
  f: Bool? = null;
  g: String? = null;
  h: Int? = null;
  i: String = "bye";
  j: Int = 10;
}

contract LargeNested {
  data: Large = Large{
    a:1,
    b:2,
    c:3,
    d:true,
    e:"hi",
    f:null,
    g:null,
    h:null,
    i:"bye",
    j:10
  };
  init() {}
}