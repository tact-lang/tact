// struct with many diverse optional and required fields
struct Madness {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
  i: Cell;
  j: Cell?;
  k: Slice;
  l: Slice?;
}

contract Divers {
    data: Madness;
    init() {
        self.data = Madness{
            a:1,
            b:null,
            c:true,
            d:null,
            e:"hi",
            f:null,
            g:myAddress(),
            h:null,
            i:emptyCell(),
            j:null,
            k:emptyCell().asSlice(),
            l:null
        };
    }
}