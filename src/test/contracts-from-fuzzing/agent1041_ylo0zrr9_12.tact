struct Tertiary {
    a: Int;
    label: String?;
}

struct Secondary {
    t: Tertiary;
    flag: Bool;
}

struct Primary {
    s: Secondary;
    desc: String;
}

contract TestNestedStructs {
    data: Primary;

    init() {
        self.data = Primary{
            s: Secondary{
                t: Tertiary{ a: 42, label: null },
                flag: true
            },
            desc: "desc"
        };
    }
}
