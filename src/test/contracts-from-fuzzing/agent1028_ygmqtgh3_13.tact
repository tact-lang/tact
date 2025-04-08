struct DefaultsInnermost {
    x: Int = 99;
    y: Bool?;
}

struct DefaultsMiddle {
    innermost: DefaultsInnermost;
    comment: String = "none";
}

contract TestDefaults {
    data: DefaultsMiddle;

    init() {
        self.data = DefaultsMiddle{
            innermost: DefaultsInnermost{
                y: true
            },
            comment: "set"
        };
    }
}