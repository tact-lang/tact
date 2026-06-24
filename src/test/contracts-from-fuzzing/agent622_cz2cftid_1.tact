struct Nested {
  x: Int = 1;
  y: Bool?;
}

struct Wrapper {
  inner: Nested;
  label: String = "hello";
}

contract NestedStructTest {
  data: Wrapper = Wrapper{
    inner: Nested{
      y: null,
      x: 1
    },
    label: "hi"
  };
  init() {}
}