struct Inner { i: Int; }

struct Middle { val: Inner?; }

struct Outer { mid: Middle; }

contract NestOptStruct {
  payload: Outer;

  init() {
    self.payload = Outer {
      mid: Middle { val: null }
    };
  }
}