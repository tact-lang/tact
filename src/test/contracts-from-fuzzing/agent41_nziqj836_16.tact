struct Leaf {
    value: Int;
}

struct Middle {
    leaf: Leaf?;
}

contract TestContract {
    data: Middle?;

    init() {
        self.data = Middle{ leaf: null };
    }

    receive() {
        self.data;
    }
}