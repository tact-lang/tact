struct Inner {
    V: Int;
}

struct MapStruct {
    Data: map<Int, Inner>;
}

message MapMsg {
    MS: MapStruct;
}

contract TestMapStruct {
    receive(msg: MapMsg) {
        let counter: Int = 0;
        foreach (key, value in msg.MS.Data) {
            counter = counter + value.V;
        }
    }
}
