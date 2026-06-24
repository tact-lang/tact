struct OptOne {
    inner: Int?;
}
struct OptTwo {
    next: OptOne?;
}

contract ChainedOptionals {
    val: OptTwo?;
    
    init() {
        self.val = OptTwo{ next: null };
    }
}