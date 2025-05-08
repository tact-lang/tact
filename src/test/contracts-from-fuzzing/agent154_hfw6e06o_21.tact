struct SOpt {
    val: Int?;
}

contract FieldPunningOptional {
    sf: SOpt;

    init() {
        let val: Int? = 123;
        self.sf = SOpt{val};
    }
}