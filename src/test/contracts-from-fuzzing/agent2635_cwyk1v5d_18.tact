struct Inner1 { x: Int }
struct Inner2 { y: Int }
struct NestBoth {
  a: Inner1;
  b: Inner2;
}
contract BothNested {
  store: NestBoth;
  init(){
    self.store = NestBoth{
      a: Inner1{ x:1 },
      b: Inner2{ y:2 }
    };
  }
}