struct Inner {
    inn: Int;
}

contract OptionalNested {
    val: Inner?;
    
    init() {
        self.val = null;
    }
}