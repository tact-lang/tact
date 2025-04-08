struct S {
  a: Int;
  b: Int?;
}

contract AssignNestedOpt {
    field: S;

    init() {
        self.field = S{a: 5, b: 10};
        self.field.b = null;
    }
}