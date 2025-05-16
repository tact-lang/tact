struct MixTypes {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: Address;
  f: Address?;
  g: Cell;
  h: Cell?;
  i: String;
  j: String?;
}

contract TestContract {
  val: MixTypes;

  init() {
    self.val = MixTypes{
      a:1, b:null, c:true, d:null, e:myAddress(), f:null, g:emptyCell(), h:null, i:"hi", j:null,
    };
  }
}