struct ManyOptionals {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Bool?;
    f5: Int?;
    f6: String?;
}

contract TestContract {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            f1: null,
            f2: "abc",
            f3: null,
            f4: true,
            f5: 100,
            f6: null
        };
    }
}
