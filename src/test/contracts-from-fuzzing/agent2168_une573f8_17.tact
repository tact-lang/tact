struct Deep {
  z: Int = 7;
}

struct MiddleOpt {
  d: Deep? = null;
}

struct OuterOpt {
  m: MiddleOpt? = null;
}

contract MutlOptNestedDefaults {
  storageField: OuterOpt;

  init() {
    self.storageField = OuterOpt{}; // omit, defaults to null middle
  }
}