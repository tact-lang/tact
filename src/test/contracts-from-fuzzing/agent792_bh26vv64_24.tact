struct Inner2 {
    z: Address?;
}

contract TestC {
    val: Inner2;

    init() {
        self.val = Inner2{ z: null };
    }
}