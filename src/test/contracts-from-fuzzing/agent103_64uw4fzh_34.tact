struct DeepInner {
    x: Int;
    y: String?;    
}

struct Outer {
    a: Int?;       
    inner: DeepInner?;  
}

contract TestContract {
    field: Outer?;     
    
    init() {
        self.field = null;     
    }
}