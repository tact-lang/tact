contract TestMapGetExists {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value for key 1
        self.m.set(1, 200);
        // Get the value for key 1
        let val = self.m.get(1);
    }
}
