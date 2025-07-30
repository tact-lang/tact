struct MultiTypeOptional {
    oi: Int?;
    os: String?;
    ob: Bool?;
    oa: Address?;
}

contract MultiTypeOptionalStorage {
    data: MultiTypeOptional;

    init() {
        self.data = MultiTypeOptional{
            oi: null,
            os: null,
            ob: null,
            oa: null,
        };
    }
}