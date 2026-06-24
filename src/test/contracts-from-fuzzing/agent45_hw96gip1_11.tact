contract TestGetterModify {
    v: Int = 0;

    receive () {}

    get fun getMod(): Int {
         // Attempt to modify state variable in a getter
         self.v = self.v + 1;
         return self.v;
    }
}
