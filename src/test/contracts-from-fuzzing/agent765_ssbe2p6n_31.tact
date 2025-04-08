struct Rec1 {
  next: Rec2;
}

struct Rec2 {
  next: Rec3;
}

struct Rec3 {
  intVal: Int;
}

contract RecContract {
  field: Rec1;
  init() {
    self.field = Rec1{next: Rec2{next: Rec3{intVal: 123}}};
  }
}