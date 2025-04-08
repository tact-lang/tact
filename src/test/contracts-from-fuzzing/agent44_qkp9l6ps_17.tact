struct HasDefaultAndOptional {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract DefaultAndOptionalStructTest {
    data: HasDefaultAndOptional;

    init() {
        self.data = HasDefaultAndOptional{
            b: null,
            d: null,
        };
    }
}