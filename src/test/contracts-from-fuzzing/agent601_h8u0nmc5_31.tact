// Check storage with nested structs of optional basic types
struct InnerOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct OuterOpt {
    inn: InnerOpt;
}

contract StorageOptional {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            inn: InnerOpt{
                f1: null,
                f2: null,
                f3: null,
            }
        };
    }
}
