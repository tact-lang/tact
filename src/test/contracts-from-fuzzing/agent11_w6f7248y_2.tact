struct Deep {
    innermost: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    nest: Deep;
    
    init() {
        self.nest = Deep{ innermost: Inner{ value: 42 } };
    }
}