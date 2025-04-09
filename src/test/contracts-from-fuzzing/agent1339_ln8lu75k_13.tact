struct ManyOptionals {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
}

contract LotOfOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{};
    }
}