// Persistent state is optional struct with default null
struct DataStruct {
    x: Int;
    y: Bool;
}

contract OptStructVar {
    var: DataStruct?;

    init() {
        self.var = null;
    }
}
