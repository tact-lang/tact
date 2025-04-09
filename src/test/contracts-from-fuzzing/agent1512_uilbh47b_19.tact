struct Leaf {
    score: Int?;
}

struct Container {
    name: String?;
    child: Leaf?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            name: null,
            child: Leaf{ score: 99 }
        };
    }
}