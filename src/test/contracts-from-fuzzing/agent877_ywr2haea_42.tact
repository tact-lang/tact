// Contract having optional pointing to struct with optional string field
struct SS {
    val: String?;
}

contract OptionalStructOptField {
    storage: SS?;

    init() {
        self.storage = SS{
            val: null,
        };
    }
}