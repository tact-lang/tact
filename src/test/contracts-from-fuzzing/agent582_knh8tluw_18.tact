struct OptionalEmbed {
    flag: Bool;
    content: Inner?;
}

struct Inner {
    txt: String;
}

contract OptionalInnerStruct {
    s: OptionalEmbed;

    init() {
        self.s = OptionalEmbed{
            flag: true,
            content: Inner{
                txt: "hi"
            }
        };
    }
}
