struct OnlyOptional {
    value: Int?;
}

contract OptionalInStruct {
    data: OnlyOptional;

    init() {
        self.data = OnlyOptional{
            value: null
        };
    }
}