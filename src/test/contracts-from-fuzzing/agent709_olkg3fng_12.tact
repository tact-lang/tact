struct Leaf {
    x: Int?;
    y: String?;
}

struct Wrapper {
    leaf: Leaf?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            leaf: Leaf{
                x: null,
                y: null
            }
        };
    }
}