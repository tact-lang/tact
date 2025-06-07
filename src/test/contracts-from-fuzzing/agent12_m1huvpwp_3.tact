struct Wide {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: String?;
    f5: Bool?;
    f6: Int?;
    f7: Address?;
    f8: Bool?;
    f9: String?;
    f10: Int?;
}

contract TestContract {
    data: Wide;

    init() {
        self.data = Wide{
            f1: null, f2: 2, f3: 3, f4: "s", f5: true, f6: null,
            f7: null, f8: false, f9: null, f10: 10
        };
    }
}