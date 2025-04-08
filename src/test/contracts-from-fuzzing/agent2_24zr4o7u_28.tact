struct HasDefaultInit {
    x: Int = 7;
}

contract Defaults {
    f1: HasDefaultInit;

    init() {
        self.f1 = HasDefaultInit{};
    }
}