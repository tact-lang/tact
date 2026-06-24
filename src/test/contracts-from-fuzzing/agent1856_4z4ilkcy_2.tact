struct BigOptional {
  intField: Int?;
  boolField: Bool?;
  strField: String?;
}

contract ManyOptionals {
    bigField: BigOptional;

    init() {
        self.bigField = BigOptional{
            intField: null,
            boolField: null,
            strField: null,
        };
    }
}
