contract TestContract {
    field1: Int = 1;
    field2: Int = 2;
    field3: Int = 3;
    field4: Int = 4;
    field5: Int;  
    
    init() {
        self.field5 = 5;
    }
    
    receive() {
        self.field5 += 1;
    }
}