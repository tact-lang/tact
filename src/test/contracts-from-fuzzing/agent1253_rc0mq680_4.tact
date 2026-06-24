struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
}

contract Test {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}
