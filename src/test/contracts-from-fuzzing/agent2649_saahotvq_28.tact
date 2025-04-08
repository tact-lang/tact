struct NestedDefaultLayer {
    x: Int = 5;
    y: Bool = false;
}

struct DefaultOuter {
    inner: NestedDefaultLayer = NestedDefaultLayer{};
    s: String = "abc";
}

contract MultiDefaultInit {
    val: DefaultOuter;

    init() {
       self.val = DefaultOuter{};
    }
}