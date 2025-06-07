contract TestDefaultFixed {
    v: Int = 0; // default initialization

    receive() {}

    get fun getDefault(): Int {
         return self.v;
    }
}
