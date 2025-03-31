contract GetterMod {
    x: Int;

    init() {
        self.x = 5;
    }
    
    // Getter that attempts to modify the state variable
    get fun getX(): Int {
        self.x = 10;
        return self.x;
    }
}
