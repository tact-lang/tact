contract TestMapExists {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        // Set a value for key 68
        self.m.set(68, 123);
        // Test exists for existing key
        let exists68: Bool = self.m.exists(68);
        if (!exists68) { throw(0); }

        // Test exists for a non-existing key
        let exists69: Bool = self.m.exists(69);
        if (exists69) { throw(1); }
    }

    receive() {}
}
