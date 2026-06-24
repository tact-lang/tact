struct SOptEmbedded {
    val: Int?;
}

contract OptEmbedded {
    f: SOptEmbedded;

    init() {
        self.f = SOptEmbedded{
            val: null,
        };
    }
}