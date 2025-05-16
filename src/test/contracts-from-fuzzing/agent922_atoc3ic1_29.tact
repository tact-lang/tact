contract Weird {
    a:Int; b:Bool; c:String; d:Slice; e:Cell; f:Int?; g:Bool?; h:String?;

    init() {
      self.a=42;
      self.b=false;
      self.c="weird";
      self.d=emptyCell().asSlice();
      self.e=emptyCell();
      self.f=100;
      self.g=true;
      self.h=null;
    }
}