struct DeeplyOptional {
    nested: Int?;
    nested2: Bool?;
    nested3: Address?;
    nested4: Cell?;
    nested5: Slice?;
    nested6: String?;
}

contract OptionalVariations {
    stored: DeeplyOptional?;

    init() {
        self.stored = null;
    }
}