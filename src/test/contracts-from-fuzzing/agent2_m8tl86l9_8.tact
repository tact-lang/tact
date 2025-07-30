// Test map with struct as value
struct Data {
    x: Int;
    y: Int;
}

contract Test {
    m: map<Int, Data>;

    init() {
        self.m = emptyMap();
    }
    
    receive() {
        self.m.set(1, Data{x:1,y:2});
    }
}