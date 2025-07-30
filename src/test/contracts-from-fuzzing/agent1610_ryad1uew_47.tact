struct InnerX { val: Int }

contract OptionalStructField {
    field: InnerX?;

    init() {
        self.field = null;
    }
}