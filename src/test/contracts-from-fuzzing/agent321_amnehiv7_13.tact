struct Fat {
  v1: Int;
  v2: Bool;
  v3: Cell;
  v4: Address;
  v5: Int?;
  v6: Bool?;
  v7: Address?;
  v8: Cell?;
  v9: String?;
  v10: String;
  v11: Int;
  v12: Bool;
  v13: Cell;
  v14: Address;
  v15: String;
}

contract FatFields {
  f: Fat;

  init() {
    self.f = Fat{
      v1:1, v2:true, v3:emptyCell(), v4:myAddress(),
      v5:null, v6:null, v7:null, v8:null, v9:null,
      v10:"x", v11:2, v12:false, v13:emptyCell(), v14:myAddress(), v15:"y"
    };
  }
}