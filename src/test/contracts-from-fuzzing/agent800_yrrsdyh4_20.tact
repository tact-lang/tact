struct MaxIntPersist {
    n: Int = 57896044618658097711785492504343953926634992332820282019728792006155588075519;
}

contract MaxIntTest {
    val: MaxIntPersist;
    init() {
        self.val = MaxIntPersist{};
    }
}