struct Rec0 {
  nested: Int?;
}

struct Rec1 {
  next: Rec0?;
}

struct Rec2 {
  next: Rec1?;
}

struct Rec3 {
  next: Rec2?;
}

contract DeepNulls {
  data: Rec3;
  init() {
    self.data = Rec3{ next: null };
  }
}