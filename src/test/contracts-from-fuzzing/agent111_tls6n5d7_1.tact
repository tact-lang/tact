contract TestPrimitive {
    value: Int = 100;
    
    receive() {}
    
    get fun getValue(): Int {
         return self.value;
    }
}
