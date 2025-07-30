struct OuterMany {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
  i: String;
}

contract LargeMultiType {
    val: OuterMany;

    init() {
        self.val = OuterMany{
            a:1,b:true,c:"c1",
            d:2,e:false,f:"c2",
            g:3,h:true,i:"c3",
        };
    }
}
