struct BigDefaultOpt {
  a:Int? = null;
  b:Int? = null;
  c:Bool? = null;
  d:String? = null;
  e:Cell? = null;
}

contract DefaultOptVals {
  data: BigDefaultOpt;
  init() {
    self.data = BigDefaultOpt{};
  }
}