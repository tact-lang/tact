contract TestMapKeyMissing {
    myMap: map<Int, Int>;

    init() {
         self.myMap = emptyMap();
         self.myMap.set(1, 100);
    }

    receive() {}

    get fun missingKey(): Int? {
         return self.myMap.get(2);
    }
}
