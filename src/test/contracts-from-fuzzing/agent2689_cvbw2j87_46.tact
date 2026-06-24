struct CustomNested {
    nested1: Wrap1;
}

struct Wrap1 {
    nested2: Wrap2;
}

struct Wrap2 {
    nested3: Int;
}

contract WrappedStructs {
    s: CustomNested;

    init() {
        self.s = CustomNested{
            nested1: Wrap1{
                nested2: Wrap2{
                    nested3: 42,
                },
            },
        };
    }
}