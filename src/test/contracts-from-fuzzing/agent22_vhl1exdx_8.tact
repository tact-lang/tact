contract TestGetterDefaultFixed {
    x: Int;

    init() {
         // Not explicitly setting x, relying on default initialization is not allowed, so we explicitly set it
         self.x = 0;
    }

    receive() {}

    get fun getX(): Int {
         return self.x;
    }
}
