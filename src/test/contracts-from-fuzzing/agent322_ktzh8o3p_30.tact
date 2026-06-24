struct Inner {
  value: Int = 0;
}

struct Outer {
  inner: Inner = Inner{};
  flag: Bool = false;
}

contract DefaultsEverywhere {
  data: Outer = Outer{};
}