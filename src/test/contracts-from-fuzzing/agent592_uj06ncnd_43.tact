struct HasStrOpt {
  s: String?;
}

contract NestedStringOpt {
  f: HasStrOpt;
  g: HasStrOpt?;
  init(){
    self.f=HasStrOpt{s:"foo"};
    self.g=null;
  }
}