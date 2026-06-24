// optional large struct with nested optional primitives
struct Big {
  a: Int?; b: Bool?; c: String?; d: Address?; e: Cell?; f: Slice?; g: Builder?;
}

contract BigOption {
  big: Big?;

  init() {
    self.big = Big{
      a:null,b:true,c:null,d:myAddress(),e:emptyCell(),f:null,g:beginCell()
    };
  }
}