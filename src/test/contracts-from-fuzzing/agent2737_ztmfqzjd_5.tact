struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Int;
}

contract MultipleNestedStructs {
    data: Outer;

    init() {
      self.data = Outer{
        x: Inner{a:1,b:true},
        y: Inner{a:2,b:false},
        z: 42
      };
    }
}