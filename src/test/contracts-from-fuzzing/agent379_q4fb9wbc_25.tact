struct SingleOptional {
  value: Int?;
}

contract SetNullStructField {
    optField: SingleOptional;

    init() {
        self.optField = SingleOptional{ value: null };
    }
}