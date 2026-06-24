struct MinIntPersist {
    n: Int = -57896044618658097711785492504343953926634992332820282019728792006155588075520;
}

contract MinIntTest {
    val: MinIntPersist;
    init() {
        self.val = MinIntPersist{};
    }
}