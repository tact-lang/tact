contract TestMapReturn {
    // State variable: an empty map from Int to Int
    m: map<Int, Int> = emptyMap();

    // Getter that returns the map
    get fun getMap(): map<Int, Int> {
        return self.m;
    }

    receive() {
        // Using the getter
        let returnedMap = self.getMap();
    }
}
