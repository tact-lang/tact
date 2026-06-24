struct BigNested {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
}

struct Container {
  n1: BigNested;
  n2: BigNested;
  n3: BigNested;
  n4: BigNested;
  n5: BigNested;
  n6: BigNested;
}

contract MassivelyNested {
  big: Container;

  init() {
    self.big = Container{
      n1: BigNested{ a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" },
      n2: BigNested{ a:2,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" },
      n3: BigNested{ a:3,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" },
      n4: BigNested{ a:4,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" },
      n5: BigNested{ a:5,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" },
      n6: BigNested{ a:6,b:false,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"" }
    };
  }
}