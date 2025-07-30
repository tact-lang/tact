message Divisor {
    x: Int;
}

contract TestDynamicDivisionCatch {
    receive(msg: Divisor) {
        try {
            let result: Int = 42 / msg.x;
            dump(result);
        } catch (err) {
            // Catch division by zero error with exit code 4
            dump(err);
        }
    }
}
