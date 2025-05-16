// Test large struct with many varied fields
struct FatStruct {
  i1: Int;
  i2: Int;
  i3: Int;
  i4: Int;
  s1: String;
  s2: String;
  s3: String;
  s4: String;
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
  addr1: Address;
  addr2: Address;
  c1: Cell;
  c2: Cell;
  sl1: Slice;
  sl2: Slice;
  bu1: Builder;
  bu2: Builder;
}

contract LargeComposite {
    obj: FatStruct;

    init() {
        self.obj = FatStruct{
            i1:1, i2:2, i3:3, i4:4,
            s1:"one", s2:"two", s3:"three", s4:"four",
            b1:true, b2:false, b3:true, b4:false,
            addr1:myAddress(), addr2:myAddress(),
            c1:emptyCell(), c2:emptyCell(),
            sl1:emptyCell().asSlice(), sl2:emptyCell().asSlice(),
            bu1:beginCell(), bu2:beginCell()
        };
    }
}
