contract TestGetter {
    x: Int;

    init() {
        self.x = 0;
    }

    get fun modifyGetter(): Int {
       self.x = 42; // modifying state variable in getter
       return self.x;
    }
}
