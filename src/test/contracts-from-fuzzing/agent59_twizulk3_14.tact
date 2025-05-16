contract TestArithShift {
    fun test(): Int {
       return (-1) >> 1; // expecting arithmetic right shift, result should be -1
    }
    
    receive() {
       dump(self.test());
    }
}
