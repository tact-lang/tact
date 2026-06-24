struct OptionalWithInner {
  inner: InnerStruct?;
}

struct InnerStruct {
  val1: Int;
  val2: Bool;
}

contract OptionalWithInnerTest {
    s: OptionalWithInner;

    init() {
        self.s = OptionalWithInner{
            inner: InnerStruct{
                val1: 15,
                val2: false
            }
        };
    }
}
