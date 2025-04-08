struct ManyLevels {
  v1:Int; v2:Int?; v3:Bool; v4:Bool?; v5:String; v6:String?; v7:Address; v8:Address?; v9:Cell; v10:Cell?;
}
contract FlatBigMany {
  s: ManyLevels;
  init(){
    self.s=ManyLevels{
      v1:1,v2:null,v3:true,v4:null,v5:"a",v6:null,
      v7:myAddress(),v8:null,v9:emptyCell(),v10:null
    };
  }
}