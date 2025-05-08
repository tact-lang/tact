trait DataTrait {
    val: Int;
}

contract TraitStorage with DataTrait {
    val: Int;

    init() {
        self.val = 999;
    }
}