contract TestGetterModification {
    v: Int = 0;

    receive() {}

    get fun modify(): Int {
         self.v += 1;
         return self.v;
    }
}
