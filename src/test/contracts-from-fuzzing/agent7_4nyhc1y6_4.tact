contract IfElseTest {
    receive() {
        let x: Int = 10;
        
        // if-else statement, true branch
        if (x > 5) {
            dump(1);
        } else {
            dump(2);
        }
        
        // if statement without else
        if (x < 0) {
            dump(3);
        }
        
        // nested if-else
        if (x == 10) {
            if (x == 10) {
                dump(4);
            } else {
                dump(5);
            }
        } else {
            dump(6);
        }
    }
}
