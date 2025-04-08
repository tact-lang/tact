struct NestedLevel3 {
   deep: Int;
}

struct NestedLevel2 {
   midinner: NestedLevel3;
}

struct NestedLevel1 {
   mid: NestedLevel2;
}

contract LevelDeep {
   field: NestedLevel1;

   init() {
     self.field = NestedLevel1{mid: NestedLevel2{midinner: NestedLevel3{deep:999}}};
   }
}
