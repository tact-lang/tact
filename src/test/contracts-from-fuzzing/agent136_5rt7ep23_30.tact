struct ChainA {
  x: Int;
}

struct ChainB {
  t: ChainA;
}

struct ChainC {
  u: ChainB;
}

struct ChainD {
  v: ChainC;
}

struct ChainE {
  w: ChainD;
}

contract FiveDeep {
   field: ChainE;

   init() {
       self.field = ChainE{ w: ChainD{ v: ChainC{ u: ChainB{ t: ChainA{ x: 999 } } } } };
   }
}