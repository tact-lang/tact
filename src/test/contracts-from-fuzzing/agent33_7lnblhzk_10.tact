contract TestGetterModify {
    x: Int = 100;

    receive() {}

    get fun getModified(): Int {
        self.x += 10; // This modification is not stored after execution
        return self.x;
    }
}
