// optional struct inside an optional struct
struct InnerMost { value: Int }
struct MiddleOpt { inner: InnerMost? }

contract OptionalInOptional {
    field: MiddleOpt?;

    init() {
        self.field = null;
    }
}
