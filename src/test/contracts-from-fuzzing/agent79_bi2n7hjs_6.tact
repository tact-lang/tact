contract TestGetter {
    get fun getNumber(): Int {
         if (true) { return 1; }
         return 2;
    }
}
