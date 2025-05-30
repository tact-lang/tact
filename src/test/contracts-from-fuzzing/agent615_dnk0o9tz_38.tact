struct VeryDeep {
  a: V1;
}
struct V1 {
  b: V2;
}
struct V2 {
  c: V3;
}
struct V3 {
  d: V4;
}
struct V4 {
  e: V5;
}
struct V5 {
  f: V6;
}
struct V6 {
  g: V7;
}
struct V7 {
  h: Int;
}

contract TestContract {
  dep: VeryDeep;

  init() {
    self.dep = VeryDeep{
      a: V1{
        b: V2{
          c: V3{
            d: V4{
              e: V5{ f: V6{ g: V7{ h: 1 } } }
            }
          }
        }
      }
    };
  }
}