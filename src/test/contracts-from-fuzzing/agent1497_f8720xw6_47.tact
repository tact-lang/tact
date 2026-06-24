// Minimal message usage combined with storage
message(12) M {}

contract TestContract {
    val: Int = 1;
    receive(_: M) {
        self.val = 7;
    }
}