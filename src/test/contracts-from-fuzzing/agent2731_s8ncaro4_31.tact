struct SubA { value: Int }
struct SubB { flag: Bool }

struct Container {
  first: SubA;
  second: SubB;
}

contract MultiTypeNested {
  data: Container;

  init() {
    self.data = Container{first:SubA{value:1}, second:SubB{flag:true}};
  }
}