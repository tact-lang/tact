contract TestMapGetter {
    myMap: map<Int, Int>;

    receive() {}

    // Getter accessing a non-existent map key
    get fun getMapValue(): Int? {
        // Attempt to get value for key 10, which doesn't exist, expected to return null
        return self.myMap.get(10);
    }
}
