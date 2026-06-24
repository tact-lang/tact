struct InnerMost { n: Int?; flag: Bool = true; }

struct Middle {
  text: String = "hi";
  inner: InnerMost? = null;
}

struct Top {
  count: Int = 1;
  middle: Middle = Middle{ text: "hi", inner: null };
}

contract DeepNest {
  top: Top = Top{ count: 1, middle: Middle{ text: "hi", inner: null } };
}