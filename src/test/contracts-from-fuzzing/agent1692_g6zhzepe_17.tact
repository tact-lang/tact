struct OptionalDeepEmbedded {
    s1: Int?;
    s2: Int?;
    s3: String?;
}

struct DeepOptContainer {
    inner: OptionalDeepEmbedded?;
}

contract OptDeepEngrain {
    field: DeepOptContainer?;
    init() {
        self.field = null;
    }
}