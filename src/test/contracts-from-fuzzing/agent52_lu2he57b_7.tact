extends mutates fun inc(self: Int): Int {
    self += 1;
    return self;
}

contract TestInc {
    fun run(): Int {
       let x = 10;
       return x.inc();
    }
    
    receive() {
       let r: Int = self.run();
       cashback(sender());
    }
}
