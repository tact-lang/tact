struct Large {
  f1:Int; f2:Bool; f3:String; f4:Int; f5:String; f6:Bool;
  f7:Int; f8:String; f9:Bool; f10:String;
}

contract BigPersist {
  state: Large;

  init() {
    self.state = Large{
      f1:1, f2:true, f3:"a", f4:4, f5:"b", f6:false, f7:7, f8:"c", f9:true, f10:"d"
    };
  }
}