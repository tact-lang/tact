struct PartialDefaults {
    val: Int = 5;
    flag: Bool = false;
    text: String = "none";
    optNum: Int?;
}

contract TestContract {
    p: PartialDefaults;

    init() {
        self.p = PartialDefaults{
            optNum: 100,
        };
    }
}
