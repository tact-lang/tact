contract TestMapCorrect {
    // Persistent state variable of type map<Int, Int> should be initialized empty by default as per documentation  
    myMap: map<Int, Int>;

    init() {
        // no explicit initialization needed
    }

    receive() {}
}
