struct Inner { x: Int; y: Bool; z: String; }
struct Outer { nested: Inner; note: String; }

contract DeepNested {
  payload: Outer;

  init() {
    self.payload = Outer{
      nested: Inner{ x: 10, y: false, z: "hi" },
      note: "check"
    };
  }
}