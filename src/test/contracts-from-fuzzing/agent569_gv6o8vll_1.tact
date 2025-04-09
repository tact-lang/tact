struct DeepNest1 { x: Int; }

contract TestContract {
    val: DeepNest1;
    
    init() {
        self.val = DeepNest1{ x: 1 };
    }
}