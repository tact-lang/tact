// Optional wrapping an entire struct with multiple optional fields
struct MultiOpt {
    one: Int?;
    two: Bool?;
    label: String?;
}

contract OptWholeStruct {
    all: MultiOpt?;

    init() {
        self.all = null;
    }
}
