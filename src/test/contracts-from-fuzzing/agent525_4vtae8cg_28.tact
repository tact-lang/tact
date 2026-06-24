// Contract with nested optional struct having default null
struct HasOpt {
  opt: Int?;
}

contract OptStructField {
    field: HasOpt?;
    init() {
        self.field = null;
    }
}