contract FuzzPlusPlus {
    receive() {
        // Deliberately malformed operator sequence: using double plus operator
        let a = 5 ++ 6;
        a;
    }
}
