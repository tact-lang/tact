struct Sub {
    g: Int?;
}
struct Super {
    h: Sub;
    i: Bool;
}

contract NestedOptionalStruct {
    state: Super;

    init() {
        self.state = Super{
            h: Sub{ g: null },
            i: true
        };
    }
}