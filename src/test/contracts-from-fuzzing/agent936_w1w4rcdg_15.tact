struct SOpt {
    val: Int?;
}

contract OptionalInline {
    field: SOpt;

    init() {
        self.field = SOpt{ val: null };
    }

    receive() {
        let _ = self.field.val;
    }
}