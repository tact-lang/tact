struct Flat {
  a:Int; b:Int?; c:Bool; d:String?; e:Bool?; f:Int;
}

contract ManyOptionalsFlat {
  store: Flat;

  init(){
    self.store = Flat{
      a:1,b:null,c:true,d:"wow",e:null,f:99
    };
  }
}