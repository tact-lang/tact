struct OptionalArray {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
}

contract ManyNulls {
    data: OptionalArray;

    init() {
        self.data = OptionalArray{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
        };
    }
}
