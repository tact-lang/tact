// complex nested optional inside struct
struct Inner {
  val: Int;
  txt: String?;
}
struct Middle {
  inner: Inner?;
}
contract NestedOptInStruct {
  data: Middle;

  init() {
    self.data = Middle{
      inner: null
    };
  }
}