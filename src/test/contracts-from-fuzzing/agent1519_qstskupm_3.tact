struct Leaf {
    val: Int = 1;
}

struct Container {
    leafOpt: Leaf?; 
    flag: Bool = false;
}

contract OptStructField {
    data: Container = Container{};

    init() {
        self.data = Container{ leafOpt: Leaf{val: 42}, flag: true };
    }
}