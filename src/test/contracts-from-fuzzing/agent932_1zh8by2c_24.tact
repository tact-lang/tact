// Struct with many optional fields that are nested optionals inside optionals (edge of nested optional limit)
struct OptWrap {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct TopO {
    wrap: OptWrap?;
    flag: Bool;
}

contract OptionalsLayers {
    val: TopO?;

    init() {
        self.val = null;
    }
}
