struct InnerStruct {
  val: Int;
}

struct Wrapper {
  inner: InnerStruct?;
}

contract OptionalNested {
    state: Wrapper = Wrapper{
        inner: null
    };

    init() {
        self.state = Wrapper{
            inner: InnerStruct{ val: 5 }
        };
    }
}
