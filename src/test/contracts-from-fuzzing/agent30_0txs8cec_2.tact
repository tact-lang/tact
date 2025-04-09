contract Test1 {
    m: map<Int, Int>; // persistent state variable, initialized to null

    receive() {
        self.m = emptyMap(); // initialize
        self.m.set(7, 70);
        let x: Int = self.m.get(7)!!;
        dump(x);
    }
}
