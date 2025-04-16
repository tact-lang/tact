struct LayeredDefaults {
  a: Int = 42;
  b: String = "hey";
}

struct UseLayered {
  d: LayeredDefaults;
}

contract DefaultNestedStructs {
  z: UseLayered;

  init() {
    self.z = UseLayered{
      d: LayeredDefaults{}
    };
  }

  receive() {
    let _ = self.z.d.a;
  }
}
