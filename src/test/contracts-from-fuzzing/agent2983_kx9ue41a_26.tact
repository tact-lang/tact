struct SOpt {
    val: Int?;
}

contract StructNullableInit {
    data: SOpt;

    init() {
        self.data = SOpt { val: null };
    }
}