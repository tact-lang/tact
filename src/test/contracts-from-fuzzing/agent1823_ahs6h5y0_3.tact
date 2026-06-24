struct DefaultsAndOptional {
    withDefault: Int = 5;
    noDefault: Int;
    optDefault: Int?;
    optNull: Bool?;
}

contract DefaultStorage {
    data: DefaultsAndOptional;

    init() {
        self.data = DefaultsAndOptional{
            noDefault: 10,
            withDefault: 20,
            optDefault: null,
            optNull: true
        };
    }
}