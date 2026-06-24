struct Inner {
  x: Int;
  y: Bool;
}

struct Container {
  a: Inner;
  b: Inner;
  c: Inner;
  d: Inner;
  e: Inner;
  f: Inner;
  g: Inner;
  h: Inner;
  i: Inner;
  j: Inner;
}

contract ManyNestedStructs {
  payload: Container;

  init() {
    self.payload = Container{
      a: Inner{ x:1, y:true },
      b: Inner{ x:2, y:false },
      c: Inner{ x:3, y:true },
      d: Inner{ x:4, y:false },
      e: Inner{ x:5, y:true },
      f: Inner{ x:6, y:false },
      g: Inner{ x:7, y:true },
      h: Inner{ x:8, y:false },
      i: Inner{ x:9, y:true },
      j: Inner{ x:10,y:false }
    };
  }
}