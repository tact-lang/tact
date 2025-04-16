struct Layer2 {
    z:Bool;
}
struct Layer1 {
    y:Layer2;
}
contract StorageDeepNesting {
    x:Layer1;
    init() {
        self.x = Layer1{ y: Layer2{ z:true } };
    }
}