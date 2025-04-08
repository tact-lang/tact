struct Inner { val: Int = 3; }
struct Outer { 
    mandatory: Int; 
    optionalInner: Inner? = null; 
    label: String = "default"; 
}

contract TestContract {
    config: Outer;

    init() {
        self.config = Outer{ mandatory: 42 };
    }
}