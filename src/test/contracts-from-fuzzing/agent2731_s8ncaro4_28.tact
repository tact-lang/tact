struct SubPayload {
  foo: Int;
  bar: Bool;
}

struct FullPayload {
  sub: SubPayload;
  name: String;
  extra: String?;
}

contract HeteroNested {
  nested: FullPayload;

  init() {
    self.nested = FullPayload{sub:SubPayload{foo:1,bar:true},name:"x",extra:null};
  }
}