trait TBase {
    val: Int;
}

contract TraitInheritance with TBase {
    val: Int;
    init() {
        self.val = 100;
    }
    receive() {
        let _ = self.val;
    }
}