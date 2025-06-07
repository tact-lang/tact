contract TestInt() {
    fun run() {
       let a: Int = 1 + 1;
       let b: Int = 2 / 2;
       let c: Int = 3 / 2; // expecting floor division to 1 as per documentation
       dump(a);
       dump(b);
       dump(c);
    }
    receive() {
       self.run();
       return;
    }
}
