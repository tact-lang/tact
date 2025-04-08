struct Inner { x: Int = 5; y: Bool?; }
struct Middle { inner: Inner; z: String = "X"; }
struct Outer { mid: Middle; q: Bool?; }

contract DeepDefaults {
  data: Outer = Outer{ mid: Middle{ inner: Inner{} } };
}