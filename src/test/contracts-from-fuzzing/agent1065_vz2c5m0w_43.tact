// Optional String field inside nested struct
struct InnerOne {
    name: String?;
}

contract OptionalStructString {
    entry: InnerOne;

    init() {
        self.entry = InnerOne{
            name: null
        };
    }
}
