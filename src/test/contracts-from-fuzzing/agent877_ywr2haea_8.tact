struct Inner1 {
  intVal: Int;
}

struct Inner2 {
  boolVal: Bool;
}

struct Inner3 {
  stringVal: String;
}

struct Container {
  f1: Inner1;
  f2: Inner2;
  f3: Inner3;
}

contract NestedContainers {
  storage: Container;

  init() {
    self.storage = Container{
      f1: Inner1{ intVal: 10 },
      f2: Inner2{ boolVal: true },
      f3: Inner3{ stringVal: "hello" },
    };
  }
}