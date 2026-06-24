struct DefaultNested {
  inner: Int = 5;
  optInner: Int?;
}

contract DefOptVals {
  storage: DefaultNested = DefaultNested{inner: 7, optInner: null};
}
