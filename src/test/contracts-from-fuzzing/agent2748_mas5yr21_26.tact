struct EmbedBuilder {
    b: Builder;
}

contract BuilderInStruct {
    eb: EmbedBuilder;

    init() {
        self.eb = EmbedBuilder{
            b: beginCell()
        };
    }
}