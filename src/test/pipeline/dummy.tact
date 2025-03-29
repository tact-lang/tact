contract Test {
    f: StateInit;
    
    init() {
       self.f = initOf Test();
    }
}