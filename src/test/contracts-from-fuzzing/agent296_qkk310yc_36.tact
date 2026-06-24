struct AlphabetSoup {
  a: Int;  b: Bool;  c: String;
  d: Int?; e: Bool?; f: String?;
  g: Int;  h: Bool;  i: String;
  j: Int?; k: Bool?; l: String?;
}

contract SoupContract {
    val: AlphabetSoup;

    init() {
        self.val = AlphabetSoup{
          a:1, b:true, c:"x",
          d:null, e:false, f:"foo",
          g:2, h:true, i:"y",
          j:null, k:true, l:null
        };
    }
}
