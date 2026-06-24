struct Data0 {
  x: Int;
}

struct Data1 {
  a: Data0;
  y: Int;
  z: Bool;
}

struct Data2 {
  b: Data1;
  flag: Bool;
  e: String;
}

struct Data3 {
  payload: Data2;
  text: String?;
}

contract DeepWide {
  state: Data3;

  init() {
    self.state = Data3{
      payload: Data2{
        b: Data1{
          a: Data0{ x: 7 },
          y: 17,
          z: false
        },
        flag: true,
        e: "hey!"
      },
      text: null
    };
  }

  receive() {
    let _ = self.state.payload.b.a.x;
  }
}
