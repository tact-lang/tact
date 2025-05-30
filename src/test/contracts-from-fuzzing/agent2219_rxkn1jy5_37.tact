struct BigDefaults {
  a: Int=1;
  b: Int=2;
  c: Int=3;
  d: Int=4;
  e: Int=5;
  f: Int=6;
  g: Int=7;
  h: Int=8;
  i: Int=9;
  j: Int=10;
}

contract BigDefaultsContract {
    f: BigDefaults;

    init() {
        self.f = BigDefaults{
          a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        };
    }
}