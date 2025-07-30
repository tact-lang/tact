struct L4 {
    val: Int = 42;
}

struct L3 {
    leaf: L4?;
}

struct L2 {
    child: L3? = null;
}

struct L1 {
    deep: L2?;
}

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{ deep: null };
    }
}
