struct DeepEmbed {
    innerInt: Int;
    innerBool: Bool;
    innerOptional: String?;
}

struct MidEmbed {
    deep: DeepEmbed;
    flag: Bool;
}

contract TestStorage {
    mid: MidEmbed;

    init() {
        self.mid = MidEmbed{
            deep: DeepEmbed{
                innerInt: 7,
                innerBool: false,
                innerOptional: null,
            },
            flag: true,
        };
    }
}