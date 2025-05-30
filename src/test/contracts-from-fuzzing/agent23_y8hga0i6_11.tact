trait MyAbstract {
    abstract const A: Int;
}

contract TestAbstractCorrect with MyAbstract {
    override const A: Int = 123;
    
    receive() {
        let v: Int = self.A;
    }
}
