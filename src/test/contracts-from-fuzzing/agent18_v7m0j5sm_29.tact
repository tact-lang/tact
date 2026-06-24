struct Rec1 {
  next: Rec2?;
}

struct Rec2 {
  next: Rec3?;
}

struct Rec3 {
  next: Rec4?;
}

struct Rec4 {
  next: Rec5?;
}

struct Rec5 {
  end: Int;
}

contract RecursiveOptionals {
  val: Rec1;

  init() {
    self.val = Rec1{ next: Rec2{ next: Rec3{ next: Rec4{ next: Rec5{ end:42 } } } } };
  }
}