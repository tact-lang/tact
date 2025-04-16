struct DeepOptional {
    val1: Int?;
    val2: String?;
    val3: Bool?;
    val4: Cell?;
    val5: Address?;
}

struct HasDeepOptional {
    d: DeepOptional;
}

contract DeepOptionalStorage {
    data: HasDeepOptional;

    init() {
        self.data = HasDeepOptional {
            d: DeepOptional{
                val1: null,
                val2: null,
                val3: null,
                val4: null,
                val5: null,
            }
        };
    }
}