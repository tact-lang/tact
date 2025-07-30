struct MaybeData { x: Int; }

contract TestContract {
    myData: MaybeData?;
    count: Int;
    
    init() {
        self.myData = null;
        self.count = 0;
    }
}