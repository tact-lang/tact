struct Wide {
  flag: Bool = false;
  c: Cell? = null;
  addr: Address? = null;
  intVal: Int = 0;
  optInt: Int? = null;
  str: String = "";
  slice: Slice? = null;
}

contract WideFields {
  wide: Wide = Wide{ flag: false, c: null, addr: null, intVal: 0, optInt: null, str: "", slice: null };
}