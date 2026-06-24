contract TestPrimitive {
    value: Int = 10;
    
    receive() {}
    
    get fun getValue(): Int {
         return self.value;
    }
}
