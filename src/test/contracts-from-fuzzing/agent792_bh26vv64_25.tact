struct Inner2 {
    z: Address? = null;
}

contract TestC {
    val: Inner2;

    init() {
        self.val = Inner2{};
    }
}