fun nestedLoopReturn(n: Int): Int {
    repeat (n) {
         if (n % 2 == 0) {
             {
                return n;
             }
         }
    }
    return n + 1;
}

// Another function testing multiple nested returns with conditional blocks
fun multiReturnTest(x: Int): Int {
    if (x == 0) {
        return 0;
    } else {
        {
            if (x > 100) {
                return 100;
            } else {
                return x;
            }
        }
    }
}

// Getter with nested returns
struct Triple {
    a: Int;
    b: Int;
    c: Int;
}

contract TestGetterNested {
    counter: Int = 50;

    get fun getTriple(): Triple {
        if (self.counter < 10) {
            return Triple { a: 1, b: 2, c: 3 };
        } else {
            {
                if (self.counter > 100) {
                    return Triple { a: 4, b: 5, c: 6 };
                } else {
                    return Triple { a: self.counter, b: self.counter + 1, c: self.counter + 2 };
                }
            }
        }
    }
}

// Receiver function with nested blocks and early return
contract ReceiverNested {
    // Using Slice message type; assume Slice supports bits()
    receive(msg: Slice) {
        if (msg.bits() == 0) {
            return;
        } else {
            {
                if (msg.bits() > 10) {
                    return;
                } else {
                    return;
                }
            }
        }
    }
}
