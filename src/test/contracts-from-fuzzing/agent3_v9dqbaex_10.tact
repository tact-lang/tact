contract TestMapAsCell {
    store: map<Int, Int> = emptyMap();

    receive() {}

    get fun getMapCell(): Cell? {
         return self.store.asCell();
    }
}
