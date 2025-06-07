struct BoolAndOptional {
    f1: Bool;
    f2: Int?;
}

contract BoolAndOptionalTest {
    data: BoolAndOptional;

    init() {
        self.data = BoolAndOptional{
            f1:true,
            f2:null
        };
    }
}