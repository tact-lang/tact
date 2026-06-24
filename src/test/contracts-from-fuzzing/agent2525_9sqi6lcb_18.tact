// Contract with optional struct field with optional inner fields

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}