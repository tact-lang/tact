struct OptionalsLayered {
    a: Int?;
    b: InnerOptionals?;
}

struct InnerOptionals {
    c: Bool?;
    d: String?;
    e: Address?;
}

contract OptionalsMany {
    ol: OptionalsLayered;

    init() {
        self.ol = OptionalsLayered{
            a:null, b:null
        };
    }
}