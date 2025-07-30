struct BaseStruct {
    x: Int;
    y: Bool;
    z: String;
}

struct EmbedOptional {
    inner: BaseStruct?;
}

contract OptionalStructEmbed {
    data: EmbedOptional;

    init() {
        self.data = EmbedOptional{ inner: null };
    }
}
