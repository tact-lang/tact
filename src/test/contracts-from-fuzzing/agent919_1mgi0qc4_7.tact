struct OptionalStruct {
  val: Int?;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}