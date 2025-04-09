trait T1 {
    abstract const C: Int;
}

trait T2 with T1 {
    override const C: Int = 10;
}

contract E() with T2 {
    receive() {
        // Use the constant defined in T2
        self.reply(self.C.toString().asComment());
    }
    
    override fun reply(body: Cell?) {
        // Dummy implementation to satisfy BaseTrait's requirement
    }
}
