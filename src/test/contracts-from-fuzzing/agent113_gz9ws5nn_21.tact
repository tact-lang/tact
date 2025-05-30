struct NestDeep1 {
  next: NestDeep2;
}
struct NestDeep2 {
  next: NestDeep3;
}
struct NestDeep3 {
  next: NestDeep4;
}
struct NestDeep4 {
  next: NestDeep5;
}
struct NestDeep5 {
  leaf: Int;
}

contract VeryDeepNested {
  root: NestDeep1;

  init() {
    self.root = NestDeep1{
      next: NestDeep2{
        next: NestDeep3{
          next: NestDeep4{
            next: NestDeep5{
              leaf: 777
            }
          }
        }
      }
    };
  }
}