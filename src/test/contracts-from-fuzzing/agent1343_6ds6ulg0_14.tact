struct Deeply {
  lvl1: Int;
  lvl2: Int?;
  lvl3: Bool;
  lvl4: Bool?;
  lvl5: Address;
  lvl6: Address?;
  lvl7: String;
  lvl8: String?;
  lvl9: Cell;
  lvl10: Cell?;
}

contract HasDeeply {
  field: Deeply;

  init() {
    self.field = Deeply{
      lvl1:1, lvl2:null, lvl3:false, lvl4:true, lvl5:myAddress(), lvl6:null, lvl7:"str", lvl8:null, lvl9:emptyCell(), lvl10:null
    };
  }
}
