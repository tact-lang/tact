struct InnerInner {
  x: Int;
  opt: Int?;
}

struct Inner {
  nested: InnerInner;
  str: String;
  flag: Bool;
}

struct Wrap {
  _1: Inner;
  _2: Inner;
  _3: Inner;
}

contract MultipleNestedStructs {
    content: Wrap;

    init() {
        self.content = Wrap{
            _1: Inner{nested: InnerInner{x: 1, opt: null}, str: "", flag: false},
            _2: Inner{nested: InnerInner{x: 2, opt: null}, str: "", flag: true},
            _3: Inner{nested: InnerInner{x: 3, opt: null}, str: "", flag: false},
        };
    }
}