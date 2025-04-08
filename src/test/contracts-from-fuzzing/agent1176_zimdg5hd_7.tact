struct Inn {
  z: String;
}

struct Mid {
  y: Bool;
  innOpt: Inn?;
}

contract ParamNested(
  idx: Int,
  midVal: Mid,
  midOpt: Mid?  
) {
  receive() {
    self.idx + 1;
  }
}