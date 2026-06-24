contract TestIfElse {
    receive() {
        // Testing if-else statement as a conditional expression via separate bindings
        // Using if-else as a statement
        if (5 > 3) {
            // This branch is taken
            let result: String = "Branch True";
            // We can emit the result via asComment to ensure function is used
            let _cell: Cell = result.asComment();
        } else {
            let result: String = "Branch False";
            let _cell: Cell = result.asComment();
        }
        
        return;
    }
}
