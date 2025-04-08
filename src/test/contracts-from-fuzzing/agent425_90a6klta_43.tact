// stress optional nested with deep defaults nested several layers
struct Layer3 {
    val: Int? = null;
}

struct Layer2 {
    l3: Layer3? = null;
}

struct Layer1 {
    l2: Layer2? = null;
}

contract TestContract {
    s: Layer1;

    init() {
        self.s = Layer1{};
    }
}