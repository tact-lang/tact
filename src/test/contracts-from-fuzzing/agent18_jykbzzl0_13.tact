struct Data {
    mm: map<Int, Int>;
}

contract Test {
    receive() {}
    
    // Getter returning a struct that contains a map
    get fun getData(): Data {
         return Data { mm: emptyMap() };
    }
}
