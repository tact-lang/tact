trait Tr {
    val: Int;
}

contract TraitMix with Tr {
    val: Int;

    init() {
        self.val = 42;
    }
}