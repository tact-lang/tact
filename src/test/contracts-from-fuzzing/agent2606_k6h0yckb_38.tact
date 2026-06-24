struct OptAlias {
  a: Int? as uint4;
  b: Int? as int8;
}

contract SerializeOptStruct {
  field: OptAlias;

  init() {
    self.field = OptAlias{ a:null, b:null };
  }
}