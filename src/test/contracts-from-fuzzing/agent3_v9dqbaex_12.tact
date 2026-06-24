contract TestGetterModify {
    v: Int = 0;

    receive() {}

    // Even though this getter modifies state, the changes won't be persisted
    get fun modifyAndReturn(): Int {
         self.v += 1;
         return self.v;
    }
}
