contract TestMut {
    value: Int;
    
    init() {
        self.value = 42;
    }
    
    receive() {
        self.value = self.value.incr();
        dump(self.value); // expected 43
        cashback(sender());
    }
    
    get fun getValue(): Int {
        return self.value;
    }
}

extends mutates fun incr(self: Int): Int {
    self += 1;
    return self;
}

fun main() {}
