struct DeepNulls {
    inn: InnerNulls?;
}

struct InnerNulls {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract InnerNullDefaults {
    val: DeepNulls;

    init() {
        self.val = DeepNulls{
            inn: null,
        };
    }
}