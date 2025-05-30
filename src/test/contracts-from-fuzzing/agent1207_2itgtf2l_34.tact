struct SVal {
    x: Int;
    y: Int?;
}

contract OptionalStructDefault {
    val: SVal? = null;

    init() {
        self.val = null;
    }
}