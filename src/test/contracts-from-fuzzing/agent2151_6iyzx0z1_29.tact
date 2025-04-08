// Optional nested struct as optional contract field
struct Small {
    a: Int;
    b: Int; 
}

contract OptStructField {
    s: Small?;

    init() {
        self.s = null;
    }
}