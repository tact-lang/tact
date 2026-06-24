struct MapStruct {
    data: map<Int, Int>;
}

contract TestMapStruct {
    receive() {
        // Initialize a map with two entries
        let mapData: map<Int, Int> = emptyMap();
        mapData.set(1, 100);
        mapData.set(2, 200);

        // Instantiate the struct containing the map
        let m = MapStruct{ data: mapData };

        // Iterate over the map to sum the values
        let sum: Int = 0;
        foreach (key, value in m.data) {
            sum += value;
        }
        dump(sum); // Expected: 300
    }
}
