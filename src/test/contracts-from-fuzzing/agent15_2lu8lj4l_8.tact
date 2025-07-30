contract TestGetterMap2 {
    // Declare a persistent state variable of type map<Int, Int>
    m: map<Int, Int>;

    // Getter returning the entire map; persistent maps are initialized as empty by default
    get fun getMap(): map<Int, Int> {
        return self.m;
    }

    // The receive function ensures that all code is compiled
    receive() {}
}
