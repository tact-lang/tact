struct NestedOptionalLevel2 {
  x: Int?;
  y: String?;
}

struct NestedOptionalLevel1 {
  inner: NestedOptionalLevel2?;
}

contract OptionalInNested {
    persistent: NestedOptionalLevel1;

    init() {
        self.persistent = NestedOptionalLevel1{
            inner: NestedOptionalLevel2{
                x: null,
                y: "hello"
            }
        };
    }
}
