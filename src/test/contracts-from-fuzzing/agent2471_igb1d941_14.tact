struct SubStruct {
    x: Int;
    y: Bool;
}

contract OptionalFieldStruct {
    subs: SubStruct?;

    init() {
        self.subs = SubStruct{
            x: -17,
            y: true,
        };
    }
}