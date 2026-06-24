struct Inner { foo: Int?; } 

contract TestContract {
    bar: Inner;
    
    init() {
        self.bar = Inner{ foo: null };
    }
}