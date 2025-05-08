struct BigNested {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
}

struct Container {
  x: BigNested;
  y: BigNested;
}

contract TwoNest {
  cont: Container;

  init() {
    self.cont = Container{
      x: BigNested{ a:1,b:true,c:"X",d:emptyCell(),e:emptyCell().asSlice() },
      y: BigNested{ a:2,b:false,c:"Y",d:emptyCell(),e:emptyCell().asSlice() }
    };
  }
}
