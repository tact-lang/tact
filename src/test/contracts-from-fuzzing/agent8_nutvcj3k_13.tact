contract Test {
    receive() {
        // Test logical augmented assignment operators (&&= and ||=) available since Tact 1.6
        let b: Bool = true;
        b &&= false;
        dump(b);   // expected output: false

        b = false;
        b ||= true;
        dump(b);   // expected output: true
    }
}
