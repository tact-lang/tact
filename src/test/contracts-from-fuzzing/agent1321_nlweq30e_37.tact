// flattening a large number of optional primitive fields directly on contract
contract FlatOpts {
  o1: Int?;
  o2: Int?;
  o3: Bool?;
  o4: Bool?;
  o5: String?;
  o6: String?;
  o7: Address?;
  o8: Address?;
  o9: Cell?;
  o10: Slice?;
  o11: Builder?;

  init() {
    self.o1=null; self.o2=1; self.o3=true; self.o4=null;
    self.o5=null; self.o6="x"; self.o7=null; self.o8=myAddress();
    self.o9=emptyCell(); self.o10=null; self.o11=beginCell();
  }
}
