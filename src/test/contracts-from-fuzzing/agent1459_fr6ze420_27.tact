// optional struct with serialization constraint on optional int
struct OptSer {
    val: Int? as uint16;
}

contract OptSerialization {
    x: OptSer;

    init() {
        self.x = OptSer{ val: null };
    }
}
