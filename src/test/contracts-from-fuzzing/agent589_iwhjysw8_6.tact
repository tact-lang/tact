struct LargeOptional {
    val1: Int?;
    val2: Int?;
    val3: Int?;
    val4: Int?;
    val5: Int?;
    val6: Int?;
    val7: Int?;
    val8: Int?;
    val9: Int?;
    val10: Int?;
}

contract ManyOptionalFields {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            val1: null,
            val2: null,
            val3: null,
            val4: null,
            val5: null,
            val6: null,
            val7: null,
            val8: null,
            val9: null,
            val10: null,
        };
    }
}