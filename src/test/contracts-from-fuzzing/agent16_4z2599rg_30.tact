// Contract field with struct default and partial override in init()
struct Data { a:Int; b:Bool; c:String; }

contract Test {
  d: Data = Data{a:1,b:true,c:"hello"};

  init() {
    self.d = Data{a:42,b:self.d.b,c:self.d.c};
  }
}