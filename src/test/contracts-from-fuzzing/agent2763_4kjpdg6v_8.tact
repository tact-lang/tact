struct Opts {
  optInt: Int?;
  optBool: Bool?;
  optAddress: Address?;
  optString: String?;
}

contract OptionalFields {
  data: Opts;

  init() {
    self.data = Opts{
      optInt: null,
      optBool: null,
      optAddress: null,
      optString: null,
    };
  }
}