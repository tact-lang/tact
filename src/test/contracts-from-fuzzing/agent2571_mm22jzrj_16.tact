struct Inner1 {
  val: Int;
}
struct Inner2 {
  inner: Inner1;
  flag: Bool;
}
struct Inner3 {
  data: Inner2;
  text: String?;
}

contract NestedCombo {
    testField: Inner3;

    init() {
        self.testField = Inner3{
            data: Inner2{
                inner: Inner1{
                    val: 54
                },
                flag: true
            },
            text: null
        };
    }
}
