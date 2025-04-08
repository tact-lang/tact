// Test where multiple nested structs hold optional fields wrapped in optionals
struct Info {
    detail: String?;
    count: Int?;
}

struct Container {
    info: Info?;
    flag: Bool;
}

contract MultiWrappedOptionals {
    prop: Container?;

    init() {
        self.prop = null;
    }
}
