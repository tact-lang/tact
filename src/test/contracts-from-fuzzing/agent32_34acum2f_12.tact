contract Test {
    // Persistent map is automatically empty
    m: map<Int, Int>;

    receive() {}

    // Getter attempting to read a non-existent map key
    get fun getNonExistent(): Int? {
         // Accessing key 100 which was never set; should return null
         return self.m.get(100);
    }
}
