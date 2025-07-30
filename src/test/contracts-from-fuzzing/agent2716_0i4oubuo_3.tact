struct Deep1 { val1: Int; }
struct Deep2 { d1: Deep1; val2: Bool; }
struct Deep3 { d2: Deep2; val3: Int?; }
struct Deep4 { d3: Deep3; val4: Bool?; }
struct Deep5 { d4: Deep4; val5: Int; }

contract VeryDeep {
  deep: Deep5;

  init() {
    self.deep = Deep5{
      d4: Deep4{
        d3: Deep3{
          d2: Deep2{
            d1: Deep1{val1: 1},
            val2: true
          },
          val3: null
        },
        val4: false
      },
      val5: 42
    };
  }
}