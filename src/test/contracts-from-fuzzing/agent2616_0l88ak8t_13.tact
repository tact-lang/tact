struct OptNested {
  field: Int?;
}

struct ContainerOpt {
  nestedOpt: OptNested?;
  intVal: Int;
}

contract NestedOptTest {
  u: ContainerOpt;

  init() {
    self.u = ContainerOpt{
      nestedOpt: OptNested{field: 10},
      intVal: 20
    };
  }
}
