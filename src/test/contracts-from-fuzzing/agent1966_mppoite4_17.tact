struct OptStr {
  maybeText: String?;
}

struct WithOptionalStruct {
  field: OptStr?;
}

contract OuterOptStruct {
  f: WithOptionalStruct;

  init() {
    self.f = WithOptionalStruct{
      field: OptStr{ maybeText: "opt string" }
    };
  }
}
