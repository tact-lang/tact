struct Inner { val: Int = 1; }
struct Middle { inner: Inner?; }
struct Outer { middle: Middle?; }

contract DeeplyOptionalStruct {
  hierarchy: Outer?;
}