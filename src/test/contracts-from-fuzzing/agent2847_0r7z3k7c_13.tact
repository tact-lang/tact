struct SOpt {
    so1: Int?;
    so2: Bool?;
    so3: Address?;
    so4: Cell?;
    so5: Slice?;
    so6: String?;
}

contract OptStructFields {
    val: SOpt;

    init() {
        self.val = SOpt{
            so1: 10,
            so2: true,
            so3: myAddress(),
            so4: emptyCell(),
            so5: emptyCell().asSlice(),
            so6: "hi",
        };
    }
}