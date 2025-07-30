contract Test {
    // Persistent state variables of type map are automatically initialized empty
    f: map<Int, Int>;

    receive() {}

    // Getter returning the persistent map
    get fun getMap(): map<Int, Int> {
         return self.f;
    }
}
