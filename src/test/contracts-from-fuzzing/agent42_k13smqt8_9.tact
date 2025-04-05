trait Y {
    abstract fun greet(): String;
}

trait X with Y {
    override fun greet(): String {
        return "Hello";
    }
}

contract C() with X, Y {
    receive() {
        dump(self.greet());
    }
}
