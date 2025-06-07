struct ComplexRemaining {
    a: Int?;
    b: String?;
    trailing: Cell as remaining;
}

contract ComplexWithRemaining {
    val: ComplexRemaining;

    init() {
        self.val = ComplexRemaining{
            a: null,
            b: null,
            trailing: emptyCell()
        };
    }
}