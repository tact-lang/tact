contract TestUnaryNot {
    receive() {
        dump(!true);      // expected output: false
        dump(!false);     // expected output: true
        dump(!(!true));   // expected output: true
    }
}
