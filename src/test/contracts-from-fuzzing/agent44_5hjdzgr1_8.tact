extends fun customPow(self: Int, exp: Int): Int {
    let result: Int = 1;
    repeat(exp) {
        result *= self;
    }
    return result;
}

extends mutates fun increment(self: Int) {
    self += 1;
}

contract PowContract() {
    // Getter: returns 2.customPow(3), expected 8
    get fun powResult(): Int {
         return 2.customPow(3);
    }
}

contract MutateContract() {
    // Getter: initializes a local variable to 10, increments it using increment(), expected 11
    get fun mutatedValue(): Int {
         let a = 10;
         a.increment();
         return a;
    }
    receive() {
         cashback(sender());
    }
}
