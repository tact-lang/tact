contract Test4 {
    // Map from Int to Int is allowed
    data: map<Int, Int> = emptyMap();

    receive() {}

    // Getter that returns the entire map
    get fun getData(): map<Int, Int> {
        return self.data;
    }
}
