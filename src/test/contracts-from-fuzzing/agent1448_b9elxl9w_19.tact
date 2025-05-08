struct Linear1 {
    val: Int;
    next: Linear2?;
}

struct Linear2 {
    val: Int;
    next: Linear3?;
}

struct Linear3 {
    val: Int;
}

contract OptionChain {
    head: Linear1;

    init() {
        self.head = Linear1{
            val: 1,
            next: null
        };
    }
}