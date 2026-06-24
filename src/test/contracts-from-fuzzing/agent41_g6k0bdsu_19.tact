contract TestAugAssignmentBool {
    receive() {
        let b: Bool = false;
        b ||= true;   // false || true = true
        dump(b);      // expected: true
        b &&= false;  // true && false = false
        dump(b);      // expected: false
    }
}
