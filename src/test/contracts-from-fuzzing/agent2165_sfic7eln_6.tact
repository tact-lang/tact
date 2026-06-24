struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: String?;
    f7: Bool?;
    f8: Address?;
}

contract Test6 {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: 1,
            f2: null,
            f3: 3,
            f4: null,
            f5: 5,
            f6: null,
            f7: true,
            f8: null
        };
    }
}