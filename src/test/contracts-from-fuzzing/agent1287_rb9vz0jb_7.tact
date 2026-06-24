contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
    e: String = "";
    f: String? = null;
    g: Cell;
    
    init() {
        self.g = emptyCell();
    }
}