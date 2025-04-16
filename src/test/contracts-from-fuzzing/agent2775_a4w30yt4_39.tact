trait HasVar {
    some: Int;
}

contract InheritWithInit with HasVar {
    some: Int;
    
    init() {
        self.some = 42;
    }
}