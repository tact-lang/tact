struct InnerOptStruct {
  foo: Int?;
}

struct WrapOptStruct {
  bar: InnerOptStruct?;
  baz: Bool;
}

contract NestedOption {
    data: WrapOptStruct;

    init() {
        self.data = WrapOptStruct{
            bar: null,
            baz: true
        };
    }
}