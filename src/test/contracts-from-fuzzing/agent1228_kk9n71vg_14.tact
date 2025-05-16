message(0x55) Tiny {
    label: String?;
}

struct Wrap {
    tin: Tiny?;
    some: Int;
}

contract DeepNest {
    data: Wrap;

    init() {
        self.data = Wrap{
            some: 5,
            tin: Tiny{
                label: null
            }
        };
    }
}