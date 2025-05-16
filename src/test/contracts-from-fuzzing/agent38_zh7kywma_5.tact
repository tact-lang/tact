trait T {
    abstract fun foo(): Int;
}

contract X() with T {
    override fun foo(): Int {
        return 42;
    }
    
    get fun getFoo(): Int {
        return self.foo();
    }
}

fun main() {
    return;
}
