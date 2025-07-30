contract TestContract {
    s: String;
    o: String?;
   
    init() {
        self.s = "hey";
        self.o = null;
    }

    receive() {}
}