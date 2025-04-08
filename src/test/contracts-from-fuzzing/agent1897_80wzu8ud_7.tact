struct NestedLong {
  deep: NestedLevel1;
}

struct NestedLevel1 {
  mid: NestedLevel2;
}

struct NestedLevel2 {
  leaf1: Int;
  leaf2: Int?;
  leaf3: Int?;
  leaf4: Bool;
  leaf5: String;
}

contract NestedLongContract {
  myVar: NestedLong;

  init() {
    self.myVar = NestedLong{
      deep: NestedLevel1{
        mid: NestedLevel2{
          leaf1: 1,
          leaf2: null,
          leaf3: null,
          leaf4: true,
          leaf5: "leaf"
        }
      }
    };
  }
}
