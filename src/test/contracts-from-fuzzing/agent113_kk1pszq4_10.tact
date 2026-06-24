struct BigStruct {
  a: Int = 1;
  b: Int = 2;
  c: Int?;
  d: Int?;
  e: Int = 5;
  f: Int?;
  g: Int = 7;
  h: Int = 8;
  i: Int?;
  j: Int = 10;
  k: Int = 11;
  l: Int = 12;
  m: Int?;
  n: Int = 14;
  o: Int?;
  p: Int = 16;
  q: Int?;
}

contract LargeStructContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
          c: null, d: null, f: null, i: null, m: null, o: null, q: null
        };
    }
}