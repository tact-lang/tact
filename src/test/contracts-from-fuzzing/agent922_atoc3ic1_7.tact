struct Tiny { x:Int }
struct Tiny2{y:Bool}

contract TestContract {
    a:Int;
    b:Bool?;
    c:String;
    d:Cell;
    e:Slice;
    f:Tiny;
    g:Tiny2;

    init() {
      self.a=1; self.b=true; self.c="t";
      self.d=emptyCell();
      self.e=emptyCell().asSlice();
      self.f=Tiny{x:2};
      self.g=Tiny2{y:false};
    }
}