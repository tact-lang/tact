contract TestIfElseNested {
    receive() {
        let a: Int = 4;
        if (a > 5) { 
            dump(1);
        } else if (a == 4) {
            dump(2);
        } else {
            dump(3);
        }
    }
}
