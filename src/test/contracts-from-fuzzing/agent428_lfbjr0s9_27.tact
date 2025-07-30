// optional string and bools inside optional struct field inside contract
struct Flags {
    title: String?;
    enabled: Bool?;
}

contract TestContract {
    metadata: Flags?;

    init() {
        self.metadata = null;
    }
}