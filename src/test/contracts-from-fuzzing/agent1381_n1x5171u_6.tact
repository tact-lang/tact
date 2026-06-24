struct Rec1 {
  inner: Rec2;
}
struct Rec2 {
  inner: Rec3;
}
struct Rec3 {
  inner: Rec4;
}
struct Rec4 {
  inner: Rec5;
}
struct Rec5 {
  val: Int;
}

contract DeepRecursion {
    data: Rec1;

    init() {
        self.data = Rec1{ inner: Rec2{ inner: Rec3{ inner: Rec4{ inner: Rec5{ val:42 }}}}};
    }
}