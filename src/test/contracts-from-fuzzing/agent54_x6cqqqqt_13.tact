struct ManyOptionalNested {
    first: Int?;
    second: String?;
    third: Bool?;
    fourth: Cell?;
    fifth: Slice?;
    sixth: Address?;
}

contract TestNestedOptionals {
    data: ManyOptionalNested;

    init() {
        self.data = ManyOptionalNested{};
    }
}